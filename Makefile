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
	c++ $(OBJ) -o $(NAME)

%.o: %.asm
	nasm  $(INCLUDE) -felf64 $< -o $@

test: main.o $(NAME)
	$(CC) $(CFLAGS) main.c -c -o main.0
	./test

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

.PHONY: clean fclean all re
re:	fclean all