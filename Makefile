NAME = libasm

SRC = 	ft_strlen.asm
TEST = main.c

INCLUDE = -I libasam.h
OBJ = $(SRC:%.asm=%.o)


CFLAGS = -Wall -Werror -Wextra

ifdef DEBUG
	CFLAGS := $(CFLAGS) -g -fsanitize=address -fsanitize=undefined
endif

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(OBJ)

%.o: %.asm
	nasm  $(INCLUDE) -felf64 $< -o $@

main.o: main.c
	$(CC) $(CFLAGS) main.c -c -o main.o

test: main.o $(NAME)
	$(CC) $(CFLAGS) main.o -o test -L. -lasm
	./test

clean:
	rm -f $(OBJ) main.o test

fclean: clean
	rm -f $(NAME)

.PHONY: clean fclean all re
re:	fclean all