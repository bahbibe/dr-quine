NASM     = nasm
CC       = gcc
CFLAGS   = -Wall -Wextra -Werror

.PHONY: all clean fclean re

all: Colleen Grace Sully

Colleen: Colleen.o
	$(CC) $(CFLAGS) -o $@ $<

Grace: Grace.o
	$(CC) $(CFLAGS) -o $@ $<

Sully: Sully.o
	$(CC) $(CFLAGS) -o $@ $<

%.o: %.s
	$(NASM) -f elf64 $< -o $@

clean:
	rm -f *.o

fclean: clean
	rm -f Colleen Grace Sully

re: fclean all
