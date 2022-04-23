##
## EPITECH PROJECT, 2022
## B-ASM-400-TLS-4-1-asmminilibc-roxane.baert
## File description:
## Makefile
##

ASM =    nasm

ASFLAGS =    -f elf64

SRC =    strlen.asm		\
		strchr.asm		\
		strrchr.asm		\
		memset.asm		\
		memcpy.asm		\
		strcmp.asm		\
		strncmp.asm		\
		strstr.asm		\
		strcasecmp.asm	\
		strpbrk.asm		\
		strcspn.asm		\
		memmove.asm		\

OBJ =    $(SRC:.asm=.o)

NAME =    libasm.so

all: $(NAME)

$(NAME):    $(OBJ)
	ld -shared -o $@ $^

%.o: %.asm
	$(ASM) -o $@ $< $(ASFLAGS)

clean:
	rm -f *.o

fclean:    clean
	rm -f $(NAME)

re:		fclean all