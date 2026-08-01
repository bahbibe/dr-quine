NASM     = nasm
CC       = gcc
CFLAGS   = -Wall -Wextra -Werror

.PHONY: all clean fclean re

all: Colleen Grace Sully

Colleen: Colleen.o
	$(CC) $(CFLAGS) -no-pie -z noexecstack -o $@ $<

Grace: Grace.o
	$(CC) $(CFLAGS) -no-pie -z noexecstack -o $@ $<

Sully: Sully.o
	$(CC) $(CFLAGS) -no-pie -z noexecstack -o $@ $<

%.o: %.s
	$(NASM) -f elf64 $< -o $@

clean:
	rm -f *.o

fclean: clean
	rm -f Colleen Grace Sully

re: fclean all
