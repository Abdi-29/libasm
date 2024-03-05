NAME = libasm.a

SRC = 	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_strdup.s \
		ft_write.s \
		ft_read.s
TEST = main.c

INCLUDE = libasm.h
OBJ = $(SRC:%.s=%.o)


CFLAGS = -Wall -fPIE -g -fsanitize=address -fsanitize=undefined

ifdef DEBUG
	CFLAGS := $(CFLAGS) -g -fsanitize=address -fsanitize=undefined
endif

all: $(NAME)

$(NAME): $(OBJ)
	ar r $@ $(OBJ)

%.o: %.s $(INCLUDE)
	nasm  -felf64 $<

%.o: %.c
	gcc $(CFLAGS) -c $< -o $@

test: main.o $(NAME)
	gcc $(CFLAGS) $^ -o test

clean:
	rm -f $(OBJ) main.o test

fclean: clean
	rm -f $(NAME)

.PHONY: clean fclean all re
re:	fclean all