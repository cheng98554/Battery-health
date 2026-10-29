#ifndef LSTM_TXT_H
#define LSTM_TXT_H

#define LSTM_TXT_POINTS 4000U

typedef int (*LstmTextRead)(void *context, void *buffer, unsigned capacity,
                          unsigned *bytes_read);
enum {
    LSTM_TXT_OK = 0,
    LSTM_TXT_IO = -1,
    LSTM_TXT_FORMAT = -2,
    LSTM_TXT_COUNT = -3,
    LSTM_TXT_LINE_LONG = -4
};

/* Exactly 4000 nonblank rows: voltage_V#current_A; optional surrounding spaces. */
int lstm_txt_load(LstmTextRead reader, void *context, float voltage[4000],
                  float current[4000], unsigned *error_line);
const char *lstm_txt_error(int status);
#endif
