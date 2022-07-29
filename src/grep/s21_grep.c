#include "s21_grep.h"

int main(int argc, char *argv[]) {
    Flag flag = {
        .e = 0, .i = 0, .v = 0, .c = 0, .l = 0, .n = 0, .h = 0, .s = 0, .f = 0, .o = 0
    };
    char regex[100][1000];
    char files[100][1000];
    int count_regex = 0;
    int count_files = 0;
    regex_t gex;
    regmatch_t match;
    turn_on_flag(argc, argv, &flag, regex, files, &count_regex, &count_files);
    for (int j = 0; j < count_files; j++) {
        FILE *file;
        if ((file = fopen(files[j], "r")) == NULL) {
            if (!flag.s)
                fprintf(stderr, "cat: %s: No such file or directory\n", files[j]);
            continue;
        } else {
            size_t size_file = 0;
            char *string = NULL;
            int count_for_c = 0;
            int count_for_l = 0;
            int count_for_n = 0;
            while (getline(&string, &size_file, file) != -1) {
                processing_string(&flag, count_regex, count_files, &gex, &match,
                regex, files, j, string, &count_for_c, &count_for_l, &count_for_n);
            }
            free(string);
            if (flag.c) {
                if (count_files > 1 && !flag.h)
                    printf("%s:", files[j]);
                printf("%d\n", count_for_c);
            }
            if (count_for_l > 0)
                printf("%s\n", files[j]);
            fclose(file);
        }
    }
    return 0;
}

void turn_on_flag(int argc, char *argv[], Flag *flag, char regex[100][1000], char files[100][1000],
            int *count_regex, int *count_files) {
    int index = 0;
    while ((index = getopt_long(argc, argv, "e:ivclnhsf:o", NULL, NULL)) != -1) {
        switch (index) {
            case 'e':
                flag->e = 1;
                strcpy(regex[*count_regex], optarg);
                *count_regex += 1;
                break;
            case 'i': flag->i = 1; break;
            case 'v': flag->v = 1; break;
            case 'c': flag->c = 1; break;
            case 'l': flag->l = 1; break;
            case 'n': flag->n = 1; break;
            case 'h': flag->h = 1; break;
            case 's': flag->s = 1; break;
            case 'f':
                flag->f = 1;
                FILE *file;
                if ((file = fopen(optarg, "r")) == NULL) {
                    if (!flag->s)
                        perror(optarg);
                    exit(0);
                } else {
                    size_t size_file = 0;
                    char *cf = NULL;
                    while ((getline(&cf, &size_file, file)) != -1) {
                        strcpy(regex[*count_regex], cf);
                        *count_regex += 1;
                    }
                    free(cf);
                    flag->e = 1;
                    fclose(file);
                }
                break;
            case 'o': flag->o = 1; break;
        }
    }
    if (!flag->e && argc - optind > 1) {
        for (int i = optind + 1; i < argc; i++) {
            strcpy(files[*count_files], argv[i]);
            *count_files += 1;
        }
    } else {
        for (int i = optind; i < argc; i++) {
            strcpy(files[*count_files], argv[i]);
            *count_files += 1;
        }
    }
    if (!flag->e) {
        strcpy(regex[*count_regex], argv[optind]);
        *count_regex += 1;
    }
}

void processing_string(Flag *flag, int count_regex, int count_files, regex_t *gex,
regmatch_t *match, char regex[100][1000], char files[100][1000], int j, char *string,
int *count_for_c, int *count_for_l, int *count_for_n) {
    for (int i = 0; i < count_regex; i++) {
        if (!flag->i)
            regcomp(gex, regex[i], REG_EXTENDED);
        if (flag->i)
            regcomp(gex, regex[i], REG_ICASE);
        if (flag->v) {
            if (flag->n)
                *count_for_n += 1;
            if (regexec(gex, string, 1, match, 0) != 0) {
                if (flag->c && flag->l) {
                    *count_for_c = 1;
                    *count_for_l = 1;
                    regfree(gex);
                    break;
                }
                if (flag->c) {
                    *count_for_c += 1;
                    regfree(gex);
                    break;
                }
                if (flag->l) {
                    *count_for_l += 1;
                    regfree(gex);
                    break;
                }
                if (count_files > 1 && !flag->h)
                    printf("%s:", files[j]);
                if (flag->n)
                    printf("%d:", *count_for_n);
                printf("%s", string);
                if (strchr(string, '\n') == NULL)
                    printf("\n");
                regfree(gex);
                break;
            }
        }
        if (!flag->v) {
            if (flag->n)
                *count_for_n += 1;
            if (regexec(gex, string, 1, match, 0) == 0) {
                if (flag->c && flag->l) {
                    *count_for_c = 1;
                    *count_for_l = 1;
                    regfree(gex);
                    break;
                }
                if (flag->c) {
                    *count_for_c += 1;
                    regfree(gex);
                    break;
                }
                if (flag->l) {
                    *count_for_l += 1;
                    regfree(gex);
                    break;
                }
                if (count_files > 1 && !flag->h)
                    printf("%s:", files[j]);
                if (flag->n)
                    printf("%d:", *count_for_n);
                if (flag->o) {
                    while (regexec(gex, string, 1, match, 0) == 0) {
                        for (; match->rm_so < match->rm_eo; match->rm_so++)
                            printf("%c", string[match->rm_so]);
                        printf("\n");
                        string = string + match->rm_eo;
                    }
                } else {
                    printf("%s", string);
                    if (strchr(string, '\n') == NULL)
                        printf("\n");
                    regfree(gex);
                    break;
                }
            }
        }
        regfree(gex);
    }
}
