#include "sd_logger.h"
#include "ff.h" // 使用当前BSP的xilffs库
#include "xstatus.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdint.h>
#include <string.h>

static FATFS fs; // 挂载期间保持文件系统对象有效
static FIL file;
static unsigned int points;
static int recording;
static FRESULT last_error;
static char record_path[16];

double SD_CalibrateCurrent(s16 raw_ma) {
    return 1.23214862 * ((double)raw_ma / 1000.0) - 0.73766653;
}

int SD_IsRecording(void) { return recording; }
unsigned int SD_PointCount(void) { return points; }
int SD_LastError(void) { return (int)last_error; }

int SD_Start(u16 num) // 仅在主循环调用，不在中断里操作SD卡
{
    char path[16]; // 最大文件名：0:/65535.txt
    if (recording)
        return XST_FAILURE;
    last_error = f_mount(&fs, "0:/", 1); // 挂载失败不自动格式化
    if (last_error != FR_OK)
        return XST_FAILURE;
    (void)snprintf(path, sizeof path, "0:/%u.txt", (unsigned int)num);
    last_error = f_open(&file, path, FA_WRITE | FA_CREATE_NEW); // 保护已存在的记录
    if (last_error != FR_OK)
        return XST_FAILURE;
    (void)snprintf(record_path, sizeof record_path, "%s", path);
    points = 0; // 创建成功才重置计数
    recording = 1;
    return XST_SUCCESS;
}

int SD_Stop(void)
{
    if (!recording) return XST_FAILURE;
    last_error = f_close(&file);
    recording = 0;
    return last_error == FR_OK ? XST_SUCCESS : XST_FAILURE;
}

int SD_Append(u16 vbus, s16 current) // 只接收通过Sample校验的数据
{
    char line[40];
    UINT written = 0;
    unsigned long uv = (unsigned long)vbus * 1250UL; // 电压每位1.25mV
    double calibrated = SD_CalibrateCurrent(current);
    long ua_signed = (long)(calibrated * 1000000.0 + (calibrated < 0 ? -0.5 : 0.5));
    unsigned long ua = (unsigned long)(ua_signed < 0 ? -ua_signed : ua_signed);
    int length;
    FSIZE_t start;
    if (!recording)
        return XST_FAILURE;
    // 无表头：电压V#电流A，使用LF换行，与参考文件一致
    length = snprintf(line, sizeof line, "%lu.%06lu#%s%lu.%06lu\n",
                      uv / 1000000UL, uv % 1000000UL, ua_signed < 0 ? "-" : "",
                      ua / 1000000UL, ua % 1000000UL);
    if (length <= 0 || (unsigned int)length >= sizeof line) {
        last_error = FR_INT_ERR;
        goto fail;
    }
    start = f_tell(&file); // 记录行起点，短写时尽量删除不完整行
    last_error = f_write(&file, line, (UINT)length, &written);
    if (last_error != FR_OK || written != (UINT)length) {
        if (last_error == FR_OK) { // 卡满可能成功返回但写入字节数不足
            last_error = FR_DENIED;
            if (f_lseek(&file, start) == FR_OK)
                (void)f_truncate(&file); // 删除半行；介质故障时无法保证回滚成功
        }
        goto fail;
    }
    ++points; // 完整写入一行才计数
    return XST_SUCCESS;

fail:
    (void)f_close(&file); // SD错误时终止本次记录，避免重复追加半写数据
    recording = 0;
    return XST_FAILURE;
}

/* Buffered sequential reader: memory use is independent of recording length. */
static unsigned char input_block[4096];
static UINT input_pos, input_used;
static int read_pair(double pair[2]) {
    char line[64], *end;
    unsigned n = 0;
    for (;;) {
        if (input_pos == input_used) {
            last_error = f_read(&file, input_block, sizeof input_block, &input_used);
            input_pos = 0;
            if (last_error != FR_OK) return 0;
            if (!input_used) { last_error = FR_INT_ERR; return 0; }
        }
        char c = (char)input_block[input_pos++];
        if (c == '\n') break;
        if (n == sizeof(line) - 1) { last_error = FR_INT_ERR; return 0; }
        line[n++] = c;
    }
    line[n] = 0;
    pair[0] = strtod(line, &end);
    if (end == line || *end != '#') { last_error = FR_INT_ERR; return 0; }
    char *start = end + 1;
    pair[1] = strtod(start, &end);
    if (end == start || *end || !isfinite(pair[0]) || !isfinite(pair[1])) {
        last_error = FR_INT_ERR; return 0;
    }
    return 1;
}

int SD_Resample(void) {
    static double output[4000][2];
    double left[2], right[2];
    unsigned index = 0;
    char backup[16], line[64];
    FRESULT saved;
    if (recording || !points) { last_error = FR_INT_ERR; return XST_FAILURE; }
    last_error = f_open(&file, record_path, FA_READ);
    if (last_error != FR_OK) return XST_FAILURE;
    input_pos = input_used = 0;
    if (!read_pair(right)) goto read_fail;
    memcpy(left, right, sizeof left);
    for (unsigned j = 0; j < 4000; ++j) {
        uint64_t numerator = (uint64_t)j * (points - 1U);
        unsigned base = (unsigned)(numerator / 3999U);
        unsigned remainder = (unsigned)(numerator % 3999U);
        unsigned target = base + (remainder != 0);
        while (index < target) {
            memcpy(left, right, sizeof left);
            if (!read_pair(right)) goto read_fail;
            ++index;
        }
        for (unsigned ch = 0; ch < 2; ++ch)
            output[j][ch] = remainder ? left[ch] + (right[ch] - left[ch]) * remainder / 3999.0 : right[ch];
    }
    last_error = f_close(&file);
    if (last_error != FR_OK) return XST_FAILURE;
    /* Keep the original (already calibrated) measurements, never overwrite a backup. */
    snprintf(backup, sizeof backup, "%s", record_path);
    strcpy(strrchr(backup, '.'), ".raw");
    last_error = f_rename(record_path, backup);
    if (last_error != FR_OK) return XST_FAILURE;
    last_error = f_open(&file, record_path, FA_WRITE | FA_CREATE_NEW);
    if (last_error != FR_OK) {
        saved = last_error;
        (void)f_rename(backup, record_path);
        last_error = saved;
        return XST_FAILURE;
    }
    for (unsigned j = 0; j < 4000; ++j) {
        UINT written;
        int length = snprintf(line, sizeof line, "%.6f#%.6f\n", output[j][0], output[j][1]);
        if (length <= 0 || (unsigned)length >= sizeof line) { last_error = FR_INT_ERR; goto write_fail; }
        last_error = f_write(&file, line, (UINT)length, &written);
        if (last_error != FR_OK || written != (UINT)length) {
            if (last_error == FR_OK) last_error = FR_DENIED;
            goto write_fail;
        }
    }
    last_error = f_close(&file);
    if (last_error == FR_OK) return XST_SUCCESS;
    goto restore;
read_fail:
    saved = last_error;
    (void)f_close(&file);
    last_error = saved;
    return XST_FAILURE;
write_fail:
    saved = last_error;
    (void)f_close(&file);
    last_error = saved;
restore:
    saved = last_error;
    /* If recovery fails, the complete original remains at .raw. */
    if (f_unlink(record_path) == FR_OK) (void)f_rename(backup, record_path);
    last_error = saved;
    return XST_FAILURE;
}
