NAME = libasm.a

SRC = 	ft_strlen.asm ft_strcpy.asm ft_strcmp.asm ft_strdup.asm
TEST = main.c

INCLUDE = libasm.h
OBJ = $(SRC:%.asm=%.o)


CFLAGS = -Wall -Werror -Wextra -fPIE

ifdef DEBUG
	CFLAGS := $(CFLAGS) -g -fsanitize=address -fsanitize=undefined
endif

all: $(NAME)

$(NAME): $(OBJ)
	ar r $@ $(OBJ)

%.o: %.asm $(INCLUDE)
	nasm  -felf64 $<

%.o: %.c
	gcc $(CFLAGS) -fPIE -c $< -o $@

test: main.o $(NAME)
	gcc $(CFLAGS) -fPIE $^ -o test

clean:
	rm -f $(OBJ) main.o test

fclean: clean
	rm -f $(NAME)

.PHONY: clean fclean all re
re:	fclean all