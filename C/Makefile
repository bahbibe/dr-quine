CC      = clang
CFLAGS  = -Wall -Wextra -Werror

NAME    = all

.PHONY: all clean fclean re

all: Colleen Grace Sully

Colleen: Colleen.c
	$(CC) $(CFLAGS) -o $@ $<

Grace: Grace.c
	$(CC) $(CFLAGS) -o $@ $<

Sully: Sully.c
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f *.o

fclean: clean
	rm -f Colleen Grace Sully

re: fclean all
