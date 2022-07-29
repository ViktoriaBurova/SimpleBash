#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <regex.h>
#include <getopt.h>

typedef struct Flags {
    int e;
    int i;
    int v;
    int c;
    int l;
    int n;
    int h;
    int s;
    int f;
    int o;
} Flag;

void turn_on_flag(int argc, char *argv[], Flag *flag, char masks[100][1000], char files[100][1000],
            int *count_masks, int *count_files);
void processing_string(Flag *flag, int count_regex, int count_files, regex_t *gex,
regmatch_t *match, char regex[100][1000], char files[100][1000], int j, char *string,
int *count_for_c, int *count_for_l, int *count_for_n);

#endif  // SRC_GREP_S21_GREP_H_
