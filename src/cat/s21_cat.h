#ifndef SRC_CAT_S21_CAT_H_
#define SRC_CAT_S21_CAT_H_
#include <stdio.h>
#include <getopt.h>

typedef struct Flags {
    int b;
    int e;
    int n;
    int s;
    int t;
    int v;
} Flag;

const struct option long_flags[] = {
        {"number-nonblank", 0, 0, 'b'},
        {"number", 0, 0, 'n'},
        {"squeeze-blank", 0, 0, 's'},
        {0, 0, 0, 0}
};

void turn_on_flags(int argc, char *argv[], Flag *flag);
void print_with_flags(Flag *flag, FILE *file);
void flag_s(Flag *flag, FILE *file, int *s, int *count);
void flag_v(int *s);

#endif  // SRC_CAT_S21_CAT_H_
