W = -Wall -Werror -Wextra
OS = $(shell uname)

ifeq ($(OS), Linux)
	LINUX_LIBS=-D_GNU_SOURCE
endif

all:  clean s21_cat

clean:
	@rm -rf *.gc* *.o *.a *.out *.info *.cfg log.txt s21_cat

s21_cat: s21_cat.h
	@gcc $(W) s21_cat.c $(LINUX_LIBS) -o s21_cat

test: s21_cat
	sh test_cat.sh

check:
	@cppcheck --enable=all --suppress=missingIncludeSystem *.c *.h
	@cp ../../materials/linters/CPPLINT.cfg CPPLINT.cfg
	@python3 ../../materials/linters/cpplint.py --extensions=c *.c *.h
