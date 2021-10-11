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
.PHONY: clean
clean:
	rm -f $(OBJS)
