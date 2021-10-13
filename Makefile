SRC = $(wildcard *.s)               # list of source files
OBJS = $(patsubst %.s, %, $(SRC)) # list of object files

UNAME_A = $(shell uname -a)
ifneq ($(shell uname -a | grep -i aarch),)
	CC = gcc
else
	CC = aarch64-linux-gnu-gcc -static
endif

all: $(OBJS)  

%: %.s
	$(CC) -o $@ $< -g
	grep -xq "$@" .gitignore || echo $@ >> .gitignore
	
hamming_func: hamming_func.s
	$(CC) -o $@ $< use_hamming.c -g
	grep -xq "$@" .gitignore || echo $@ >> .gitignore
sqrt_approx: sqrt_approx.s
	$(CC) -o $@ $< use_sqrt_approx.c -g
	grep -xq "$@" .gitignore || echo $@ >> .gitignore
add_neon: add_neon.s
	$(CC) -o $@ $< use_add_neon.c -g
	grep -xq "$@" .gitignore || echo $@ >> .gitignore
.PHONY: clean
clean:
	rm -f $(OBJS)
