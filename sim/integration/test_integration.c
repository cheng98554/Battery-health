#include <assert.h>
#include <stdio.h>
#include <string.h>
#include "stubs/test_platform.h"
#define main firmware_main
#include "../../src/ps/main.c"
#undef main
#include "../../src/ps/usart.c"
#include "../../src/ps/sd_logger.c"
#include "../../src/ps/lstm_txt.c"
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunknown-pragmas"
#pragma GCC diagnostic ignored "-Wunused-label"
#include "../../src/hls_fast/soh_accel.cpp"
#pragma GCC diagnostic pop

static char disk[200000], disk_name[32], screen[2000000];
static size_t disk_used, screen_used;
static char backup_disk[200000], backup_name[32];
static size_t backup_used;
static int rename_error;
static int disk_exists, mount_error, read_error, write_error, short_write, close_error, sync_error;
static int mounts, read_opens, sample_fail, samples, dma_runs, dma_fail, dma_timeout;
static XTime clock_now;
static s16 sample_current = -123;
static uint32_t *dma_result;
static unsigned read_limit = 4096;
static uint8_t hardware_fifo[64];
static unsigned hardware_head, hardware_tail;

static void clear_screen(void) { screen_used = 0; screen[0] = 0; }
static void feed(uint8_t command, uint16_t number) {
    const uint8_t bytes[] = {0xFE, command, (uint8_t)number, (uint8_t)(number >> 8), 0xFD};
    for (unsigned j = 0; j < sizeof bytes; ++j) write1ByteToRingBuffer(bytes[j]);
}
static void advance_sample(void) { clock_now += (XTime)COUNTS_PER_SECOND * 11U / 10U; app_poll(); }
static void load_fixture(unsigned number) {
    char path[80];
    snprintf(path, sizeof path, "data/sd_card/%u.txt", number);
    FILE *f = fopen(path, "rb"); assert(f);
    disk_used = fread(disk, 1, sizeof disk - 1, f); assert(feof(f)); fclose(f);
    disk[disk_used] = 0; disk_exists = 1;
    snprintf(disk_name, sizeof disk_name, "0:/%u.txt", number);
}

FRESULT f_mount(FATFS *fs_arg, const char *path, int immediate) {
    (void)fs_arg; assert(strcmp(path, "0:/") == 0 && immediate == 1);
    assert(!SD_IsRecording()); ++mounts;
    return mount_error ? FR_NOT_READY : FR_OK;
}
FRESULT f_open(FIL *f, const char *path, int flags) {
    f->position = 0; f->mode = flags;
    if (flags == FA_READ) {
        ++read_opens;
        return disk_exists && strcmp(path, disk_name) == 0 ? FR_OK : FR_NO_FILE;
    }
    assert(flags == (FA_WRITE | FA_CREATE_NEW));
    if (disk_exists && strcmp(path, disk_name) == 0) return FR_EXIST;
    snprintf(disk_name, sizeof disk_name, "%s", path);
    disk_exists = 1; disk_used = 0; disk[0] = 0; return FR_OK;
}
FRESULT f_read(FIL *f, void *buffer, UINT capacity, UINT *count) {
    assert(f->mode == FA_READ);
    if (read_error) { *count = 0; return FR_DISK_ERR; }
    size_t available = disk_used - f->position;
    if (available > capacity) available = capacity;
    if (available > read_limit) available = read_limit;
    memcpy(buffer, disk + f->position, available);
    f->position += available; *count = (UINT)available; return FR_OK;
}
FRESULT f_write(FIL *f, const void *buffer, UINT length, UINT *written) {
    if (write_error) { *written = 0; return FR_DISK_ERR; }
    *written = short_write ? length - 1 : length;
    assert(f->position + *written < sizeof disk);
    memcpy(disk + f->position, buffer, *written);
    f->position += *written; disk_used = f->position; disk[disk_used] = 0; return FR_OK;
}
FRESULT f_rename(const char *from, const char *to) {
    if (rename_error) return FR_DISK_ERR;
    if (strcmp(from, backup_name) == 0) {
        if (disk_exists) return FR_EXIST;
        memcpy(disk, backup_disk, backup_used + 1); disk_used = backup_used;
        strcpy(disk_name, to); disk_exists = 1; backup_name[0] = 0;
        return FR_OK;
    }
    assert(disk_exists && strcmp(from, disk_name) == 0);
    if (strcmp(to, backup_name) == 0) return FR_EXIST;
    memcpy(backup_disk, disk, disk_used + 1); backup_used = disk_used;
    strcpy(backup_name, to); disk_exists = 0;
    return FR_OK;
}
FRESULT f_unlink(const char *path) {
    assert(strcmp(path, disk_name) == 0); disk_exists = 0; return FR_OK;
}
FRESULT f_lseek(FIL *f, FSIZE_t pos) { f->position = pos; return FR_OK; }
FRESULT f_truncate(FIL *f) { disk_used = f->position; disk[disk_used] = 0; return FR_OK; }
FRESULT f_sync(FIL *f) { (void)f; assert(!sync_error); return FR_OK; }
FRESULT f_close(FIL *f) { (void)f; return close_error ? FR_DISK_ERR : FR_OK; }

void XTime_GetTime(XTime *t) { if (dma_timeout) clock_now += COUNTS_PER_SECOND; *t = clock_now; }
void usleep(unsigned long delay) { clock_now += delay; }
unsigned IicLastError(void) { return 3; }
int IicInit(void) { return XST_SUCCESS; }
int Sample(u16 *voltage, u16 *current_value) {
    ++samples; if (sample_fail) return XST_FAILURE;
    *voltage = 3207; *current_value = (u16)sample_current; return XST_SUCCESS;
}
XAxiDma_Config *XAxiDma_LookupConfig(UINTPTR addr) { static XAxiDma_Config c; c.BaseAddress = addr; return &c; }
int XAxiDma_CfgInitialize(XAxiDma *d, XAxiDma_Config *c) { d->RegBase = c->BaseAddress; return XST_SUCCESS; }
int XAxiDma_HasSg(XAxiDma *d) { (void)d; return 0; }
void XAxiDma_IntrDisable(XAxiDma *d, u32 mask, int direction) { (void)d; (void)mask; (void)direction; }
int XAxiDma_SimpleTransfer(XAxiDma *d, UINTPTR addr, u32 length, int direction) {
    (void)d; if (dma_fail) return XST_FAILURE;
    if (direction == XAXIDMA_DEVICE_TO_DMA) { assert(length == 4); dma_result = (uint32_t *)addr; }
    else {
        assert(length == 800 && dma_result);
        int16_t input[200]; int32_t *words = (int32_t *)addr;
        for (unsigned j = 0; j < 200; ++j) input[j] = (int16_t)words[j];
        *dma_result = (uint32_t)soh_accel(input); ++dma_runs;
    }
    return XST_SUCCESS;
}
u32 XAxiDma_ReadReg(UINTPTR base, u32 offset) { (void)base; (void)offset; return 0; }
int XAxiDma_Busy(XAxiDma *d, int direction) { (void)d; (void)direction; return dma_timeout; }
u32 Xil_In32(UINTPTR addr) { assert(addr == LSTM_BASE); return 4; }
void Xil_Out32(UINTPTR addr, u32 val) { assert(addr == LSTM_BASE && val == 1); }
void Xil_DCacheFlushRange(UINTPTR addr, u32 length) { (void)addr; (void)length; }
void Xil_DCacheInvalidateRange(UINTPTR addr, u32 length) { (void)addr; (void)length; }
XUartPs_Config *XUartPs_LookupConfig(UINTPTR addr) { static XUartPs_Config c; c.BaseAddress = addr; return &c; }
int XUartPs_CfgInitialize(XUartPs *uart_arg, XUartPs_Config *c, UINTPTR base) { assert(base == c->BaseAddress); uart_arg->Config = *c; return 0; }
void XUartPs_SetInterruptMask(XUartPs *uart_arg, u32 mask) { (void)uart_arg; (void)mask; }
void XUartPs_SetOperMode(XUartPs *uart_arg, u32 mode) { (void)uart_arg; (void)mode; }
int XUartPs_SetBaudRate(XUartPs *uart_arg, u32 rate) { (void)uart_arg; assert(rate == 115200); return 0; }
int XUartPs_SetDataFormat(XUartPs *uart_arg, XUartPsFormat *f) { (void)uart_arg; assert(f->BaudRate == 115200 && f->DataBits == 8 && f->Parity == 0 && f->StopBits == 1); return 0; }
void XUartPs_SetFifoThreshold(XUartPs *uart_arg, u8 threshold) { (void)uart_arg; assert(threshold == 1); }
void XUartPs_WriteReg(UINTPTR base, u32 offset, u32 value) { (void)base; (void)offset; (void)value; }
int XUartPs_IsReceiveData(UINTPTR base) { (void)base; return hardware_head < hardware_tail; }
u8 XUartPs_RecvByte(UINTPTR base) { (void)base; assert(hardware_head < hardware_tail); return hardware_fifo[hardware_head++]; }
void XUartPs_SendByte(UINTPTR base, u8 byte) {
    assert(base == STDOUT_BASEADDRESS && screen_used + 1 < sizeof screen);
    screen[screen_used++] = (char)byte; screen[screen_used] = 0;
    if (screen_used >= 3 && memcmp(screen + screen_used - 3, "\xff\xff\xff", 3) == 0) {
        size_t end = screen_used - 3, start = end;
        while (start && (unsigned char)screen[start - 1] != 0xff) --start;
        if (end - start >= 8 && memcmp(screen + start, "t0.txt=\"", 8) == 0)
            assert(end - start >= 9 && end - start - 9 <= 10);
    }
}
int XSetupInterruptSystem(void *ref, void (*handler)(void *), u32 id, UINTPTR parent, u32 priority) {
    (void)ref; (void)handler; (void)id; (void)parent; (void)priority; return 0;
}

int main(void) {
    uint8_t command; uint16_t number;
    assert(UART_Init() == XST_SUCCESS && dma_init() == XST_SUCCESS && self_test() == XST_SUCCESS);
    model_ready = 1; clear_screen();
    /* Inject hardware FIFO bytes without delivering an interrupt. */
    const uint8_t hardware_command[] = {0xFE, 0x22, 1, 0, 0xFD};
    memcpy(hardware_fifo, hardware_command, sizeof hardware_command);
    hardware_head = 0; hardware_tail = 3;
    assert(!ReceiveCommand(&command, &number));
    hardware_tail = 5;
    assert(ReceiveCommand(&command, &number) && command == 0x22 && number == 1);
    uint8_t last_bytes[5];
    assert(UART_GetRxSnapshot(last_bytes) == 5 && memcmp(last_bytes, hardware_command, 5) == 0);
    set_status("idle");
    assert(strstr(screen, "t0.txt=\"idle\"\xFF\xFF\xFF"));
    assert(!strstr(screen, "RX="));
    /* An IRQ can drain the same FIFO; the polling fallback must not duplicate it. */
    hardware_head = 0; hardware_tail = 5; UartHandler(&Uart);
    assert(ReceiveCommand(&command, &number) && number == 1 && usize == 0);
    assert(!ReceiveCommand(&command, &number) && UART_GetRxSnapshot(last_bytes) == 10);
    puts("PASS: hardware FIFO reception without IRQ, IRQ reception, no duplicate bytes and RX diagnostics");
    for (unsigned code = 0x21; code <= 0x22; ++code) {
        for (unsigned n = 0; n <= 65535; ++n) {
            feed((uint8_t)code, (uint16_t)n);
            assert(ReceiveCommand(&command, &number) && command == code && number == n && usize == 0);
        }
    }
    const uint8_t fragment[] = {0, 0xFE, 0x23, 1, 0, 0xFD, 0xFE, 0x22, 0x34};
    for (unsigned j = 0; j < sizeof fragment; ++j) write1ByteToRingBuffer(fragment[j]);
    assert(!ReceiveCommand(&command, &number));
    write1ByteToRingBuffer(0x12); write1ByteToRingBuffer(0xFD);
    assert(ReceiveCommand(&command, &number) && number == 0x1234);
    feed(0x22, 1); feed(0x21, 167);
    assert(ReceiveCommand(&command, &number) && command == 0x22 && number == 1);
    assert(ReceiveCommand(&command, &number) && command == 0x21 && number == 167);
    for (unsigned j = 0; j <= RINGBUFFER_LEN; ++j) write1ByteToRingBuffer(0xFE);
    assert(!ReceiveCommand(&command, &number) && usize == 0);
    feed(0x22, 0xFDFE); assert(ReceiveCommand(&command, &number) && number == 0xFDFE);
    puts("PASS: both opcodes, all 65536 IDs, fragments, noise, queued frames, overflow and payload FE/FD");

    const unsigned fixture_ids[] = {1, 167};
    const int expected_q[] = {3835, 3858};
    const char *expected_x1[] = {"x1.val=9363\xff\xff\xff", "x1.val=9419\xff\xff\xff"};
    for (unsigned j = 0; j < 2; ++j) {
        load_fixture(fixture_ids[j]); clear_screen();
        read_limit = j ? 7 : 4096;
        feed(0x22, (uint16_t)fixture_ids[j]); app_poll();
        assert((int32_t)rx[0] == expected_q[j]);
        assert(strstr(screen, expected_x1[j]) && !strstr(screen, "x2.val="));
        assert(!strstr(screen, "RESULT") && !strstr(screen, "LSTM_SD_READY"));
    }
    read_limit = 4096;
    rx[0] = (uint32_t)-4096; clear_screen(); assert(send_result() == 0);
    assert(strstr(screen, "x1.val=-10000\xff\xff\xff") && !strstr(screen, "x2.val="));
    rx[0] = INT32_MAX; clear_screen(); assert(send_result() != 0 && !strstr(screen, "x1.val="));
    puts("PASS: real TXT -> production preprocessing -> HLS C model -> exact TJC output for 1 and 167");

    int prior_runs = dma_runs;
    clear_screen(); feed(0x22, 65535); app_poll(); assert(dma_runs == prior_runs && !strstr(screen, "x1.val="));
    mount_error = 1; feed(0x22, 167); app_poll(); mount_error = 0; assert(dma_runs == prior_runs);
    read_error = 1; feed(0x22, 167); app_poll(); read_error = 0; assert(dma_runs == prior_runs);
    close_error = 1; feed(0x22, 167); app_poll(); close_error = 0; assert(dma_runs == prior_runs);
    disk_used = 0;
    for (unsigned j = 0; j < 1000; ++j) disk_used += (size_t)sprintf(disk + disk_used, "4.0#0.5\n");
    feed(0x22, 167); app_poll(); assert(dma_runs == prior_runs && strstr(app_status, "4000"));
    strcpy(disk, "4.0 0.5\n"); disk_used = strlen(disk);
    feed(0x22, 167); app_poll(); assert(dma_runs == prior_runs && strstr(app_status, "TXT format"));
    puts("PASS: missing file, mount/read/close errors and malformed/1000-row files do not run inference");

    disk_exists = 0; clear_screen(); feed(0x21, 12); app_poll();
    assert(record_armed && !SD_IsRecording() && !disk_exists);
    int prior_mounts = mounts, prior_reads = read_opens;
    feed(0x22, 12); feed(0x21, 13); app_poll();
    assert(mounts == prior_mounts && read_opens == prior_reads && record_number == 12);
    for (int value = -1901; value <= 1897; value += 3798) {
        sample_current = (s16)value; advance_sample();
        assert(record_armed && !SD_IsRecording() && !disk_exists);
    }
    sample_current = 1901;
    sample_fail = 1; advance_sample(); assert(!SD_IsRecording());
    assert(strstr(screen, "E03 1") && acquisition_stage == 0);
    size_t retry_screen_size = screen_used;
    int failed_samples = samples;
    XTime retry_time = clock_now;
    app_poll();
    assert(samples == failed_samples + 1 && clock_now == retry_time);
    assert(screen_used == retry_screen_size); /* No TX flood during immediate retries. */
    clock_now += COUNTS_PER_SECOND;
    app_poll();
    assert(screen_used > retry_screen_size && sample_failures >= 3);
    sample_fail = 0; app_poll();
    assert(sample_failures == 0 && acquisition_stage == 0);
    assert(!record_armed && SD_IsRecording() && SD_PointCount() == 1);
    assert(strcmp(disk_name, "0:/12.txt") == 0);
    assert(strcmp(disk, "4.008750#1.604648\n") == 0);
    int successful_samples = samples; app_poll(); assert(samples == successful_samples);
    feed(0x21, 13); feed(0x22, 12); app_poll();
    assert(strcmp(app_status, "recording") == 0);
    assert(mounts == prior_mounts + 1 && read_opens == prior_reads);
    sample_current = 31; /* Calibrated value is above -0.7 A. */
    for (unsigned j = 1; j < 4501; ++j) advance_sample();
    assert(SD_IsRecording() && SD_PointCount() == 4501);
    sample_current = 30; advance_sample(); advance_sample();
    assert(SD_IsRecording() && stop_samples == 2);
    sample_current = 31; advance_sample(); assert(stop_samples == 0);
    sample_current = 30; advance_sample(); assert(stop_samples == 1);
    sample_current = -1;
    sample_fail = 1; advance_sample(); assert(SD_IsRecording()); sample_fail = 0;
    app_poll(); assert(SD_IsRecording() && stop_samples == 1);
    for (unsigned j = 2; j < 8; ++j) {
        advance_sample(); assert(SD_IsRecording() && stop_samples == j);
    }
    size_t saved_size = disk_used;
    unsigned saved_points = SD_PointCount();
    advance_sample();
    assert(!SD_IsRecording() && SD_PointCount() == saved_points && backup_used == saved_size);
    assert(strcmp(app_status, "done") == 0);
    sample_current = 3000; advance_sample(); /* No automatic re-arm. */
    assert(!SD_IsRecording() && SD_PointCount() == saved_points);
    feed(0x21, 12); app_poll(); advance_sample();
    assert(!record_armed && !SD_IsRecording() && SD_LastError() == FR_EXIST);
    feed(0x22, 12); app_poll(); assert(dma_runs == prior_runs + 1 && strcmp(app_status, "OK 12") == 0);
    feed(0x21, 16); app_poll(); advance_sample(); assert(SD_IsRecording());
    close_error = 1; sample_current = -1;
    for (unsigned j = 0; j < 8; ++j) advance_sample();
    close_error = 0;
    assert(!SD_IsRecording() && strstr(app_status, "SD err"));
    puts("PASS: armed thresholds, strict boundaries, immediate retry, 4501 points, stop/close errors, busy protection and no overwrite");

    assert(SD_Start(13) == 0); short_write = 1;
    assert(SD_Append(3207, -123) != 0 && disk_used == 0 && !SD_IsRecording()); short_write = 0;
    assert(SD_Start(14) == 0); write_error = 1;
    assert(SD_Append(3207, -123) != 0 && !SD_IsRecording()); write_error = 0;
    assert(SD_Start(15) == 0); sync_error = 1;
    for (unsigned j = 0; j < 4000; ++j) assert(SD_Append(3207, -123) == 0);
    assert(SD_PointCount() == 4000 && SD_IsRecording());
    assert(SD_Stop() == 0 && !SD_IsRecording()); sync_error = 0;
    /* Linear signal: verify every output, both endpoints, up/downsampling and singleton. */
    const unsigned lengths[] = {1, 2, 3999, 4000, 4345};
    for (unsigned k = 0; k < sizeof lengths / sizeof lengths[0]; ++k) {
        unsigned n = lengths[k];
        assert(SD_Start((u16)(100 + k)) == 0);
        for (unsigned j = 0; j < n; ++j) assert(SD_Append((u16)(2000 + j), (s16)(1000 + j)) == 0);
        assert(SD_Stop() == 0 && SD_Resample() == 0);
        assert(load_sd_file((uint16_t)(100 + k)) == 0);
        for (unsigned j = 0; j < 4000; ++j) {
            double pos = (double)j * (n - 1) / 3999.0;
            assert(fabs(tx[j] - (2000 + pos) * .00125) < 0.000002);
            assert(fabs(tx[j + 4000] - (1.23214862 * (1000 + pos) / 1000 - .73766653)) < 0.000002);
        }
    }
    assert(SD_Start(110) == 0 && SD_Append(3207, 2000) == 0 && SD_Stop() == 0);
    size_t original_size = disk_used;
    read_error = 1; assert(SD_Resample() != 0 && disk_used == original_size); read_error = 0;
    rename_error = 1; assert(SD_Resample() != 0 && disk_used == original_size); rename_error = 0;
    short_write = 1; assert(SD_Resample() != 0 && disk_used == original_size && disk_exists); short_write = 0;
    assert(strcmp(disk_name, "0:/110.txt") == 0);
    assert(SD_Resample() == 0);
    puts("PASS: calibrated current, resampling all 4000 values, 1/2/3999/4000/4345 inputs, read/rename/short-write recovery");
    load_fixture(1); clear_screen(); dma_fail = 1; feed(0x22, 1); app_poll(); dma_fail = 0;
    assert(!model_ready && !strstr(screen, "x1.val="));
    prior_runs = dma_runs; feed(0x22, 1); app_poll(); assert(dma_runs == prior_runs);
    model_ready = 1; dma_timeout = 1; feed(0x22, 1); app_poll(); dma_timeout = 0;
    assert(!model_ready && strstr(app_status, "DMA time"));
    puts("PASS: short/write failures, no periodic sync through 4000 points, DMA failure and timeout guard");
    puts("ALL INTEGRATION TESTS PASSED (hardware interfaces simulated)");
    return 0;
}
