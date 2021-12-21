##
## EPITECH PROJECT, 2021
## LIBMY
## File description:
## make the libmy
##

# COLOUR
CYAN		=	'\033[0;36m'
GREEN 		= 	'\033[0;32m'
RESET		=	'\033[0m'

# TARGET
TARGET		=	libmy.a

SRCDIR		=	src/

VPATH		=	$(SRCDIR) $(OBJDIR) include/

SRC		=	$(shell find $(SRCDIR) -name '*.c')

OBJ		:=	$(SRC:%.c=%.o)

CFLAGS		=	-Iinclude -Wall -Wextra -Wpedantic

# ----------------------------------------------------------------------------

%.o: %.c
	@$(CC)     $(CFLAGS)     $^ -c -o $@
	@echo -e $(CYAN)'compil : $(notdir $^) -> $(notdir $@)'$(RESET)

.PHONY: all
all:	$(TARGET) ## Call $(TARGET)

$(TARGET):	$(OBJ) ## Build the lib
	@ar rc $(TARGET) $(OBJ)
	@echo -e $(GREEN)archived : $(TARGET)$(RESET)

.PHONY: clean
clean: ## Clean obj/*.o
	@rm -f $(OBJ)

.PHONY: fclean
fclean:	clean ## Clean the binary
	@rm -f $(TARGET)
	@echo -e $(GREEN)make fclean$(RESET)

.PHONY: re
re:	fclean all ## Fclean+All
