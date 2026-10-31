#include "xaxidma.h"
#include "xparameters.h"
#include "xil_cache.h"
#include "xil_io.h"
#include "xiltimer.h"
#include "sleep.h"
#include "lstm_preprocess.h"
#include "lstm_selftest.h"
#include "lstm_txt.h"
#include "usart.h"
#include "i2c.h"
#include "sd_logger.h"
#include "ff.h"
#include <limits.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>

#define LSTM_BASE 0x43C00000U
static int32_t features[200] __attribute__((aligned(64)));
static double raw_curves[2][LSTM_TXT_POINTS];
static float tx[2 * LSTM_TXT_POINTS] __attribute__((aligned(64)));
static uint32_t rx[16] __attribute__((aligned(64)));
static XAxiDma dma;
static FATFS sd_fs;
static FRESULT sd_read_status;
static char app_status[11] = "idle";
static XTime last_sample, last_status;
static int model_ready;
static int record_armed;
static uint16_t record_number;
/* Debugger watch: 0=loop, 1=IIC, 2=screen TX, 3=SD open,
 * 4=SD write, 5=SD close, 6=retry-status TX. */
volatile unsigned acquisition_stage;
static unsigned sample_failures;
static XTime last_retry_status;
#define RECORD_START_A 1.6
#define RECORD_STOP_A (-0.7)
#define RECORD_STOP_SAMPLES 8U
static unsigned stop_samples;

/* This UART is connected to the screen: all output uses TJC framing. */
static void set_status(const char *format, ...) {
    va_list args;
    va_start(args, format);
    vsnprintf(app_status, sizeof(app_status), format, args);
    va_end(args);
    tjc_send_txt("t0", "txt", app_status);
    XTime_GetTime(&last_status);
}

/* DMA input: 200 sign-extended Q12 words; output: one Q12 SOH ratio. */
static int lstm_transfer(void) {
    XTime start, now;
    uint32_t control = Xil_In32(LSTM_BASE);
    if (!(control & 4U)) { set_status("LSTM busy"); return XST_FAILURE; }
    rx[0] = 0x80000000U;
    Xil_DCacheFlushRange((UINTPTR)features, sizeof(features));
    Xil_DCacheFlushRange((UINTPTR)rx, sizeof(rx));
    if (XAxiDma_SimpleTransfer(&dma, (UINTPTR)rx, 4, XAXIDMA_DEVICE_TO_DMA) != XST_SUCCESS) {
        set_status("DMA RX err"); return XST_FAILURE;
    }
    Xil_Out32(LSTM_BASE, 1U);
    if (XAxiDma_SimpleTransfer(&dma, (UINTPTR)features, sizeof(features), XAXIDMA_DMA_TO_DEVICE) != XST_SUCCESS) {
        set_status("DMA TX err"); return XST_FAILURE;
    }
    XTime_GetTime(&start);
    for (;;) {
        uint32_t ts = XAxiDma_ReadReg(dma.RegBase, XAXIDMA_TX_OFFSET + XAXIDMA_SR_OFFSET);
        uint32_t rs = XAxiDma_ReadReg(dma.RegBase, XAXIDMA_RX_OFFSET + XAXIDMA_SR_OFFSET);
        if ((ts | rs) & XAXIDMA_ERR_ALL_MASK) {
            set_status("DMA error");
            return XST_FAILURE;
        }
        if (!XAxiDma_Busy(&dma, XAXIDMA_DMA_TO_DEVICE) &&
            !XAxiDma_Busy(&dma, XAXIDMA_DEVICE_TO_DMA) && (Xil_In32(LSTM_BASE) & 4U)) break;
        XTime_GetTime(&now);
        if (now - start > (XTime)COUNTS_PER_SECOND * 5U) {
            set_status("DMA time"); return XST_FAILURE;
        }
    }
    Xil_DCacheInvalidateRange((UINTPTR)rx, sizeof(rx));
    return XST_SUCCESS;
}

static int lstm_predict(void) {
    int16_t q[200];
    for (unsigned j = 0; j < LSTM_TXT_POINTS; ++j) {
        raw_curves[0][j] = tx[j];
        raw_curves[1][j] = tx[j + LSTM_TXT_POINTS];
    }
    if (nasa_preprocess(raw_curves, q) != 0) {
        set_status("Input err"); return XST_FAILURE;
    }
    for (unsigned j = 0; j < 200; ++j) features[j] = q[j];
    return lstm_transfer();
}

/* Same little-endian number and byte-wise resynchronization as i2c. */
static int ReceiveCommand(uint8_t *command, uint16_t *number) {
    UART_Poll();
    if (UART_TakeOverflow()) { set_status("UART full"); return 0; }
    while (usize >= LENGTH) {
        if (u(0) == 0xFE && (u(1) == 0x21 || u(1) == 0x22 ||
            (u(1) == 0x23 && u(2) == 0 && u(3) == 0)) && u(4) == 0xFD) {
            *command = u(1);
            *number = (uint16_t)u(2) | ((uint16_t)u(3) << 8);
            udelete(LENGTH);
            return 1;
        }
        udelete(1);
    }
    return 0;
}

static int sd_read_chunk(void *context, void *buffer, unsigned capacity, unsigned *bytes_read) {
    UINT count = 0;
    sd_read_status = f_read((FIL *)context, buffer, (UINT)capacity, &count);
    *bytes_read = (unsigned)count;
    return sd_read_status == FR_OK ? 0 : -1;
}

static int load_sd_file(uint16_t number) {
    char path[16];
    FIL file;
    FRESULT status;
    unsigned error_line = 0;
    snprintf(path, sizeof(path), "0:/%u.txt", (unsigned)number);
    status = f_mount(&sd_fs, "0:/", 1);
    if (status != FR_OK) { set_status("Mount %u", (unsigned)status); return XST_FAILURE; }
    status = f_open(&file, path, FA_READ);
    if (status != FR_OK) { set_status("Open %u", (unsigned)status); return XST_FAILURE; }
    sd_read_status = FR_OK;
    int parsed = lstm_txt_load(sd_read_chunk, &file, tx, tx + LSTM_TXT_POINTS, &error_line);
    status = f_close(&file);
    if (parsed != LSTM_TXT_OK) {
        set_status("%s", parsed == LSTM_TXT_COUNT ? "Need 4000" : parsed == LSTM_TXT_IO ? "TXT IO err" : "TXT format");
        return XST_FAILURE;
    }
    if (status != FR_OK) { set_status("Close %u", (unsigned)status); return XST_FAILURE; }
    return XST_SUCCESS;
}

/* Round to the nearest display unit, with halfway values away from zero. */
static int send_result(void) {
    int64_t soh = (int64_t)(int32_t)rx[0] * 10000; /* SOH percent * 100 */
    soh = (soh + (soh < 0 ? -2048 : 2048)) / 4096;
    if (soh < INT_MIN || soh > INT_MAX) {
        set_status("Range err"); return XST_FAILURE;
    }
    tjc_send_val("x1", "val", (int)soh);
    return XST_SUCCESS;
}

/* SOH percent * 5 - 300, rounded and saturated to the waveform range. */
static void send_batch_value(void) {
    int64_t value = (int64_t)(int32_t)rx[0] * 500 - (int64_t)300 * 4096;
    value = (value + (value < 0 ? -2048 : 2048)) / 4096;
    if (value < 0) value = 0;
    if (value > 255) value = 255;
    tjc_send_wave("add s0.id,0,", (int)value);
    tjc_send_wave("add s0.id,0,", (int)value);
}

static void run_batch(void) {
    for (uint16_t number = 100; number <= 265; ++number) {
        if (load_sd_file(number) != XST_SUCCESS) return;
        if (lstm_predict() != XST_SUCCESS) { model_ready = 0; return; }
        send_batch_value();
    }
}

static void handle_command(uint8_t command, uint16_t number) {
    /* Never remount the card or read a partially recorded file. */
    if (SD_IsRecording()) {
        set_status("recording");
        return;
    }
    if (record_armed) {
        set_status("wait %u", (unsigned)record_number);
        return;
    }
    if (command == 0x21) {
        record_number = number;
        record_armed = 1;
        stop_samples = 0;
        tjc_send_val("n2", "val", 0);
        set_status("wait %u", (unsigned)number);
        return;
    }
    if (!model_ready) { set_status("Model err"); return; }
    if (command == 0x23) { run_batch(); return; }
    set_status("pred %u", (unsigned)number);
    if (load_sd_file(number) != XST_SUCCESS) return;
    if (lstm_predict() != XST_SUCCESS) { model_ready = 0; return; }
    if (send_result() == XST_SUCCESS) set_status("OK %u", (unsigned)number);
}

static int sample_and_record(void) {
    uint16_t vbus, current;
    acquisition_stage = 1;
    if (Sample(&vbus, &current) != XST_SUCCESS) {
        XTime now;
        stop_samples = 0;
        if (sample_failures < UINT_MAX) ++sample_failures;
        XTime_GetTime(&now);
        if (sample_failures == 1 || now - last_retry_status >= COUNTS_PER_SECOND) {
            char text[11];
            snprintf(text, sizeof(text), "E%02u %u", IicLastError() % 100U, sample_failures > 999999U ? 999999U : sample_failures);
            acquisition_stage = 6;
            tjc_send_txt("t0", "txt", text);
            last_retry_status = now;
        }
        acquisition_stage = 0;
        return XST_FAILURE;
    }
    XTime_GetTime(&last_sample);
    acquisition_stage = 2;
    if (sample_failures) {
        sample_failures = 0;
        tjc_send_txt("t0", "txt", app_status);
    }
    tjc_send_val("n0", "val", (int)vbus * 1250 / 1000);
    double current_a = SD_CalibrateCurrent((s16)current);
    double current_ma = current_a * 1000.0;
    tjc_send_val("n1", "val", (int)(current_ma + (current_ma < 0 ? -0.5 : 0.5)));
    if (record_armed && current_a > RECORD_START_A) {
        record_armed = 0;
        acquisition_stage = 3;
        if (SD_Start(record_number) != XST_SUCCESS) {
            acquisition_stage = 2;
            set_status("SD err %d", SD_LastError());
            acquisition_stage = 0;
            return XST_SUCCESS;
        }
        acquisition_stage = 2;
        set_status("rec %u", (unsigned)record_number);
    }
    acquisition_stage = 0;
    if (!SD_IsRecording()) return XST_SUCCESS;
    if (current_a <= RECORD_STOP_A) ++stop_samples;
    else stop_samples = 0;
    if (stop_samples >= RECORD_STOP_SAMPLES) {
        stop_samples = 0;
        acquisition_stage = 5;
        int stopped = SD_Stop();
        acquisition_stage = 2;
        if (stopped == XST_SUCCESS) {
            set_status("resample");
            stopped = SD_Resample();
        }
        if (stopped == XST_SUCCESS) set_status("done");
        else set_status("SD err %d", SD_LastError());
        acquisition_stage = 0;
        return XST_SUCCESS;
    }
    acquisition_stage = 4;
    if (SD_Append(vbus, (s16)current) != XST_SUCCESS) {
        acquisition_stage = 2;
        set_status("SD err %d", SD_LastError());
        acquisition_stage = 0;
        return XST_SUCCESS; /* A storage error must not trigger another sample. */
    }
    acquisition_stage = 2;
    tjc_send_val("n2", "val", (int)SD_PointCount());
    acquisition_stage = 0;
    return XST_SUCCESS;
}

static void app_poll(void) {
    uint8_t command;
    uint16_t number;
    XTime now;
    while (ReceiveCommand(&command, &number)) handle_command(command, number);
    XTime_GetTime(&now);
    if (now - last_sample >= (XTime)COUNTS_PER_SECOND * 11U / 10U) { /* 1100 ms */
        /* Failed validation: retry next loop without restarting the timer or sleeping. */
        if (sample_and_record() != XST_SUCCESS) return;
    }
    XTime_GetTime(&now);
    if (now - last_status >= COUNTS_PER_SECOND) {
        tjc_send_txt("t0", "txt", app_status);
        last_status = now;
    }
    usleep(1000);
}

static int dma_init(void) {
    XAxiDma_Config *cfg = XAxiDma_LookupConfig(XPAR_XAXIDMA_0_BASEADDR);
    if (!cfg || XAxiDma_CfgInitialize(&dma, cfg) != XST_SUCCESS || XAxiDma_HasSg(&dma)) {
        set_status("DMA init"); return XST_FAILURE;
    }
    XAxiDma_IntrDisable(&dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);
    XAxiDma_IntrDisable(&dma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
    return XST_SUCCESS;
}

static int self_test(void) {
    for (int repeat = 0; repeat < 2; ++repeat) {
        for (unsigned j = 0; j < 200; ++j) features[j] = LSTM_TEST_INPUT[j];
        if (lstm_transfer() != XST_SUCCESS || (int32_t)rx[0] != LSTM_TEST_EXPECTED) {
            set_status("Test fail"); return XST_FAILURE;
        }
    }
    return XST_SUCCESS;
}

int main(void) {
    if (UART_Init() != XST_SUCCESS) return XST_FAILURE;
    if (IicInit() != XST_SUCCESS) { set_status("IIC init"); return XST_FAILURE; }
    model_ready = dma_init() == XST_SUCCESS && self_test() == XST_SUCCESS;
    if (model_ready) set_status("idle");
    XTime_GetTime(&last_sample);
    for (;;) app_poll();
}
