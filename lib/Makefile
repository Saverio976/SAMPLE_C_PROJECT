##
## EPITECH PROJECT, 2021
## LIBMY
## File description:
## make the libmy
##

TARGET		=	libmy.a

SRCDIR		=	src/

OBJDIR		=	obj/

VPATH		=	$(SRCDIR) $(OBJDIR) include/

SRC		=	$(wildcard $(SRCDIR)*.c)

OBJ		:=	$(SRC:%.c=%.o)
OBJ		:=	$(addprefix $(OBJDIR), $(notdir $(OBJ)))

CFLAGS		=	-Iinclude -Wall -Wextra -Wpedantic

# ----------------------------------------------------------------------------

$(OBJDIR)%.o: %.c
	$(CC)     $(CFLAGS)     $^ -c -o $@

.PHONY: all
all:	$(TARGET) ## Call $(TARGET)

$(TARGET):	$(OBJ) ## Build the lib
	ar rc $(TARGET) $(OBJ)

.PHONY: clean
clean: ## Clean obj/*.o
	rm -f $(OBJDIR)*.o

.PHONY: fclean
fclean:	clean ## Clean the binary
	rm -f $(TARGET)

.PHONY: re
re:	fclean all ## Fclean+All
