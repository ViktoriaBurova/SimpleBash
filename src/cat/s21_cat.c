#include "s21_cat.h"

int main(int argc, char *argv[]) {
    Flag flag = {
        .b = 0,
        .e = 0,
        .n = 0,
        .s = 0,
        .t = 0,
        .v = 0
    };
    turn_on_flags(argc, argv, &flag);
    while (optind < argc) {
        FILE *file;
        if ((file = fopen(argv[optind], "r")) == NULL) {
            printf("cat: %s: No such file or directory\n", argv[optind]);
            optind++;
            continue;
        }
        print_with_flags(&flag, file);
        fclose(file);
        optind++;
    }
    return 0;
}

void turn_on_flags(int argc, char *argv[], Flag *flag) {
    int index = 0;
    while ((index = getopt_long(argc, argv, "beEnstTv", long_flags, NULL)) != -1) {
        switch (index) {
            case 'b':flag->b = 1; break;
            case 'e':flag->e = 1; flag->v = 1; break;
            case 'E':flag->e = 1; break;
            case 'n':flag->n = 1; break;
            case 's':flag->s = 1; break;
            case 't':flag->t = 1; flag->v = 1; break;
            case 'T':flag->t = 1; break;
        }
    }
}

void print_with_flags(Flag *flag, FILE *file) {
    int s, count = 1, first_symbol = 0;
    while ((s = getc(file)) != EOF) {
        if (flag->s && s == 10)
            flag_s(flag, file, &s, &count);
        if (flag->n && !flag->b && first_symbol == 0) {
            printf("%6.d\t", count++);
            first_symbol = 1;
        }
        if (s == '\n')
            first_symbol = 0;
        if (flag->b && first_symbol == 0 && s != 10) {
            printf("%6.d\t", count++);
            first_symbol = 1;
        }
        if (flag->t && s == 9) {
            printf("^I");
            continue;
        }
        if (flag->e && s == 10)
            printf("$");
        if (flag->v) {
            flag_v(&s);
        }
        printf("%c", s);
    }
}

void flag_s(Flag *flag, FILE *file, int *s, int *count) {
    int counter = 0, next;
    while ((next = getc(file)) == 10) {
        counter++;
        *s = next;
    }
    if (next != EOF) {
        fseek(file, EOF, SEEK_CUR);
    }
    if (counter >= 1) {
        if (flag->e)
            printf("$");
        printf("\n");
        if (flag->n && !flag->b) {
            printf("%6.d\t", *count);
            *count = *count + 1;
        }
    }
}

void flag_v(int *s) {
    if (*s < 9 || (*s > 10 && *s <= 31)) {
        *s += 64;
        printf("^");
    } else if (*s == 127) {
        *s -= 64;
        printf("^");
    } else if (*s >= 128 && *s <= 159) {
        *s -= 64;
        printf("M-^");
    }
}
