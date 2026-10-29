#include "lstm_txt.h"
#include <ctype.h>
#include <errno.h>
#include <math.h>
#include <stdlib.h>

/* Single-threaded loader: keep buffers out of the small bare-metal stack. */
static unsigned char chunk[4096];
static char line[128];

static int parse_row(char *text, unsigned row, float *voltage, float *current,
                     int first_line) {
    char *p = text, *end;
    float v, i;
    if (first_line && (unsigned char)p[0] == 0xEF &&
        (unsigned char)p[1] == 0xBB && (unsigned char)p[2] == 0xBF) p += 3;
    while (isspace((unsigned char)*p)) ++p;
    if (!*p) return 0;
    if (row >= LSTM_TXT_POINTS) return LSTM_TXT_COUNT;
    errno = 0;
    v = strtof(p, &end);
    if (end == p || errno == ERANGE || !isfinite(v)) return LSTM_TXT_FORMAT;
    p = end;
    while (isspace((unsigned char)*p)) ++p;
    if (*p++ != '#') return LSTM_TXT_FORMAT;
    while (isspace((unsigned char)*p)) ++p;
    errno = 0;
    i = strtof(p, &end);
    if (end == p || errno == ERANGE || !isfinite(i)) return LSTM_TXT_FORMAT;
    while (isspace((unsigned char)*end)) ++end;
    if (*end) return LSTM_TXT_FORMAT;
    voltage[row] = v;
    current[row] = i;
    return 1;
}

int lstm_txt_load(LstmTextRead reader, void *context, float voltage[4000],
                  float current[4000], unsigned *error_line) {
    unsigned row = 0, physical_line = 1, used = 0;
    if (error_line) *error_line = 0;
    if (!reader || !voltage || !current) return LSTM_TXT_IO;
    for (;;) {
        unsigned count = 0;
        if (reader(context, chunk, sizeof(chunk), &count) != 0 || count > sizeof(chunk)) {
            if (error_line) *error_line = physical_line;
            return LSTM_TXT_IO;
        }
        for (unsigned n = 0; n < count; ++n) {
            if (chunk[n] == '\n') {
                int result;
                line[used] = '\0';
                result = parse_row(line, row, voltage, current, physical_line == 1);
                if (result < 0) {
                    if (error_line) *error_line = physical_line;
                    return result;
                }
                row += (unsigned)result;
                used = 0;
                ++physical_line;
            } else {
                if (!chunk[n] || used >= sizeof(line) - 1) {
                    if (error_line) *error_line = physical_line;
                    return chunk[n] ? LSTM_TXT_LINE_LONG : LSTM_TXT_FORMAT;
                }
                line[used++] = (char)chunk[n];
            }
        }
        if (!count) break;
    }
    if (used) {
        int result;
        line[used] = '\0';
        result = parse_row(line, row, voltage, current, physical_line == 1);
        if (result < 0) {
            if (error_line) *error_line = physical_line;
            return result;
        }
        row += (unsigned)result;
    }
    if (row != LSTM_TXT_POINTS) {
        if (error_line) *error_line = physical_line;
        return LSTM_TXT_COUNT;
    }
    return LSTM_TXT_OK;
}

const char *lstm_txt_error(int status) {
    switch (status) {
    case LSTM_TXT_IO: return "SD read failed";
    case LSTM_TXT_FORMAT: return "expected two finite numbers: voltage_V#current_A";
    case LSTM_TXT_COUNT: return "expected exactly 4000 data rows";
    case LSTM_TXT_LINE_LONG: return "TXT line exceeds 127 bytes";
    default: return "OK";
    }
}
