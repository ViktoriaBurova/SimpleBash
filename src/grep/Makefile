W = -Wall -Werror -Wextra
OS = $(shell uname)

ifeq ($(OS), Linux)
	LINUX_LIBS=-D_GNU_SOURCE
endif

all:  clean s21_grep

clean:
	@rm -rf *.gc* *.o *.a *.out *.info *.cfg log.txt s21_grep

s21_grep: s21_grep.h
	@gcc $(W) s21_grep.c $(LINUX_LIBS) -o s21_grep

test: s21_grep
	sh test_grep.sh

check:
	@cppcheck --enable=all --suppress=missingIncludeSystem *.c *.h
	@cp ../../materials/linters/CPPLINT.cfg CPPLINT.cfg
	@python3 ../../materials/linters/cpplint.py --extensions=c *.c *.h
