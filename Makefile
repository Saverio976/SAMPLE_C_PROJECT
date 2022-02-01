##
## EPITECH PROJECT, 2021
## $NAME
## File description:
## make the $NAME
##

# ----------------------------------------------------------------------------
# TARGET
ifndef
NAME		=	$NAME
endif
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# COLOUR
CYAN		=	'\033[1;36m'
BLUE		=	'\033[1;34m'
GREEN 		= 	'\033[1;32m'
RED			=	'\033[1;31m'

RESET		=	'\033[0m'
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# IN-MAKEFILE SETTINGS
CURR_RULE	=	all
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# SRC
SRCDIR		:=	src/

SRC			:=	main.c
SRC			:=	$(addprefix $(SRCDIR),$(SRC))

OBJ			:=	$(SRC:%.c=%.o)
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

TSRC		:=	test_basic.c
TSRC		:=	$(addprefix $(TSRCDIR),$(TSRC))
TSRC		:= 	$(filter-out $(SRCDIR)main.c,$(SRC))

TOBJ		:=	$(TSRC:%.c=%.o)
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# FLAGS
CFLAGS		= 	-Iinclude/ -Ilib/include/ -Wall -Wextra -Wpedantic

CR_TEST_FLAGS	=	-lcriterion --coverage
# ----------------------------------------------------------------------------

%.o: %.c
	@$(CC) $(CFLAGS) $^ -c -o $@
	@echo -e $(BLUE)'compil : $(notdir $^) -> $(notdir $@)'$(RESET)

# ----------------------------------------------------------------------------
# Make the $NAME
.PHONY: 	all
all:		CURR_RULE = all
all:		init $(LIB_TARGET)
	@$(MAKE) $(NAME) -s
	@echo -e $(GREEN)'-> [finished]: $(NAME): all'$(RESET)

$(NAME):	CURR_RULE = $(NAME)
$(NAME): 	init $(OBJ)
	@$(CC) $(OBJ) $(MAIN_OBJ) -o $(NAME) $(LDFLAGS) $(CFLAGS)
	@echo -e $(GREEN)'-> [finished]: $(NAME): $(NAME)'$(RESET)

$(LIB_TARGET):
	@$(MAKE) -s -C $(dir $(LIB_TARGET))
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Mr. clean
.PHONY: 	clean
clean:
	@$(RM) $(OBJ) $(TOBJ)
	@$(RM) vgcore.*
	@$(RM) $(TOBJ:.o=.gcno) $(TOBJ:.o=.gcda)

.PHONY: 	fclean
fclean:		CURR_RULE = fclean
fclean:		init clean
	@$(MAKE) -C $(dir $(LIB_TARGET)) fclean -s
	@$(RM) $(NAME) $(TNAME)
	@echo -e $(GREEN)'-> [finished]: $(NAME): $(CURR_RULE)'$(RESET)
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Re
.PHONY: 	re
re:		CURR_RULE = re
re:		init
	@$(MAKE) fclean -s
	@$(MAKE) all -s
	@echo -e $(GREEN)'-> [finished]: $(NAME): $(CURR_RULE)'$(RESET)
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Test
.PHONY: tests_run
tests_run: cr_tests_run

.PHONY: cr_tests_run
cr_tests_run: CFLAGS += $(CR_TEST_FLAGS)
cr_tests_run: fclean $(LIB_TARGET) $(TNAME)
	@$(CC) $(TEST_OBJ) -o $(TNAME) $(LDFLAGS) $(CR_TEST_FLAGS)
	@./$(TNAME)
	@gcovr --exclude tests/
	@gcovr --exclude tests/ --branch

.PHONY: fn_tests_run
fn_tests_run: fclean $(TNAME)
	@./tests/fn_tests.sh ./$(TNAME)
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Prety Print
.PHONY: init
init:
	@echo -e $(CYAN)'-> [starting]: $(NAME): make $(CURR_RULE)'$(RESET)
# ----------------------------------------------------------------------------
.PHONY: init_repo
init_repo:
ifeq ($(NAME), $NAME)
	@echo -e $(RED)'Make -C .git/ init_repo NAME=name_of_proj'$(RESET)
	@exit 1
endif
	rm -rf docs/
	rm -rf assets/
	rm -rf Doxyfile
	rm -rf README.md
	mv include/ ..
	mv lib/ ..
	mv src/ ..
	mv tests/ ..
	sed -n '/init_repo/q;p' Makefile > ../Makefile
	rm -f Makefile
	mv gitignore ../.gitignore
	mv github ../.github
	find .. -type f -exec sed -i "s/\$$NAME/$(NAME)/g" {} \;
