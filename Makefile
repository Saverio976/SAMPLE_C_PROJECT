##
## EPITECH PROJECT, 2021
## $NAME
## File description:
## make the $NAME
##

# ----------------------------------------------------------------------------
# TARGET
NAME		=	ttt
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# COLOUR
CYAN		=	'\033[0;36m'
GREEN 		= 	'\033[0;32m'

RESET		=	'\033[0m'
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# IN-MAKEFILE SETTINGS
CURR_RULE	=	all
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# SRC
SRCDIR		:=	src/

SRC		:=	main.c

SRC		:=	$(addprefix $(SRCDIR),$(SRC))

OBJ		:=	$(SRC:%.c=%.o)
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# LIB
LIB_TARGET	=	lib/libmy.a

LDFLAGS		=	-L$(dir $(LIB_TARGET)) -lmy
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# TEST
TNAME		:=	bin_test

TSRCDIR		:=	tests/

TSRC		:=	$(filter-out $(SRCDIR)main.c,$(SRC))	\
			test_basic.c

TSRC		:=	$(addprefix $(TSRCDIR),$(TSRC))

TOBJ		:=	$(TSRC:%.c=%.o)
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# FLAGS
CFLAGS		= 	-Iinclude/ -Ilib/include/ -Wall -Wextra -Wpedantic

CR_TEST_FLAGS	=	-lcriterion --coverage
# ----------------------------------------------------------------------------

%.o: %.c
	@$(CC) $(CFLAGS) $^ -c -o $@
	@echo -e $(CYAN)'compil : $(notdir $^) -> $(notdir $@)'$(RESET)

.PHONY: all
all:		$(LIB_TARGET) $(NAME)

$(NAME):	$(OBJ)
	@$(CC) $(OBJ) $(MAIN_OBJ) -o $(NAME) $(LDFLAGS) $(CFLAGS)
	@echo -e $(GREEN)'[finished]: $(TARGET): make $(TARGET)'$(RESET)

$(LIB_TARGET):
	@$(MAKE) -C $(dir $(LIB_TARGET)) all -s

.PHONY: clean
clean:
	@$(RM) $(OBJ) $(TOBJ)
	@$(RM) vgcore.*
	@$(RM) $(TOBJ:.o=.gcno) $(TOBJ:.o=.gcda)

.PHONY: fclean
fclean:	clean
	@$(MAKE) -C $(dir $(LIB_TARGET)) fclean -s
	@rm -f $(NAME) $(TNAME)
	@echo -e $(GREEN)'[finished]: $(TARGET): make fclean'$(RESET)

.PHONY: re
re:	fclean all

.PHONY: tests_run
tests_run: cr_tests_run

.PHONY: cr_tests_run
cr_tests_run: CFLAGS += $(CR_TEST_FLAGS)
cr_tests_run: fclean $(LIB_TARGET) $(TEST_OBJ)
	@$(CC) $(TEST_OBJ) -o $(TNAME) $(LDFLAGS) $(CR_TEST_FLAGS)
	@./$(TARGET_TEST)
	@gcovr --exclude tests/
	@gcovr --exclude tests/ --branch

.PHONY: fn_tests_run
fn_tests_run: CFLAGS
fn_tests_run: re
	@./tests/fn_tests.sh ./$(TARGET_TEST)

# ----------------------------------------------------------------------------
.PHONY: init_repo
init_repo:
	mv include/ ..
	mv lib/ ..
	mv src/ ..
	mv tests/ ..
	mv Makefile ..
	cp ~/.src/SAMPLE_C_PROJECT/.gitignore ..
	cp -r ~/.src/SAMPLE_C_PROJECT/.github ..
