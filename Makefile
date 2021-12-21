##
## EPITECH PROJECT, 2021
## sample
## File description:
## sample description
##

# COLOUR
CYAN		=	'\033[0;36m'
GREEN 		= 	'\033[0;32m'
RESET		=	'\033[0m'

# TARGET
TARGET		=	...

LIB_TARGET	=	lib/libmy.a

TARGET_TEST	=	bin_test

SRCDIR		=	src/

VPATH		=	$(SRCDIR) lib/ include/ tests/

SRC		:=	$(shell find $(SRCDIR) -name '*.c')
SRC		:=	$(filter-out $(SRCDIR)main.c, $(SRC))

OBJ		:=	$(SRC:%.c=%.o)

MAIN_SRC	=	$(SRCDIR)main.c

MAIN_OBJ	:=	$(MAIN_SRC:%.c=%.o)

TEST_SRC	= 	$(shell find tests/ -name '*.c')

TEST_OBJ	:=	$(TEST_SRC:%.c=%.o)

CFLAGS		= 	-Iinclude/ -Ilib/include/ -Wall -Wextra -Wpedantic

LFLAGS		=	-Llib/ -lmy

CR_TEST_FLAGS	=	-lcriterion

FN_TEST_FLAGS	=	-ftest-coverage -fprofile-arcs

# ----------------------------------------------------------------------------

%.o: %.c
	@$(CC)     $(CFLAGS)    $^ -c -o $@
	@echo -e $(CYAN)'compil : $(notdir $^) -> $(notdir $@)'$(RESET)

.PHONY: all
all:	$(LIB_TARGET) $(TARGET) ## Build lib+binary

$(TARGET):	$(OBJ) $(MAIN_OBJ) ## Build the binary
	$(CC) $(OBJ) $(MAIN_OBJ) -o $(TARGET) $(LFLAGS) $(CFLAGS)
	@echo -e $(GREEN)linked to $(TARGET)$(RESET)

$(LIB_TARGET): ## Build the lib
	@$(MAKE) -C lib/

.PHONY: clean
clean: ## Clean obj and gcno/gcda
	@rm -f $(OBJ) $(MAIN_OBJ)
	@rm -f vgcore.*
	@rm -f **/*.gcno **/*.gcda

.PHONY: fclean
fclean:	clean ## Clean+Remove target/target_test and call lib fclean
	@$(MAKE) -C lib/ fclean -s
	@rm -f $(TARGET) $(TARGET_TEST)
	@echo -e $(GREEN)make fclean$(RESET)

.PHONY: re
re:	fclean all ## Fclean+All

.PHONY: tests_run
tests_run: cr_tests_run ## The rule called by Marvin to make coverage

.PHONY: cr_tests_run
cr_tests_run: CFLAGS += --coverage ## Criterion tests
cr_tests_run: fclean $(LIB_TARGET) $(OBJ) $(TEST_OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(TEST_OBJ) -o $(TARGET_TEST) $(LFLAGS) \
		$(CR_TEST_FLAGS)
	./$(TARGET_TEST)
	gcovr --exclude tests/
	gcovr --exclude tests/ --branch

.PHONY: sanitize_tests_run
sanitize_tests_run: CFLAGS += -fsanitize=address -fsanitize=undefined
sanitize_tests_run: LFLAGS += -fsanitize=leak
sanitize_tests_run: all

.PHONY: fn_tests_run
fn_tests_run: CFLAGS += $(FN_TEST_FLAGS) ## Fonctional tests
fn_tests_run: fclean $(LIB_TARGET) $(OBJ) $(MAIN_OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(MAIN_OBJ) -o $(TARGET_TEST) $(LFLAGS)
	./tests/fn_tests.sh ./$(TARGET_TEST)
	gcov $(TARGET_TEST)
	gcovr --exclude tests/
	gcovr --exclude tests/ --branch

.PHONY: get_dot_files
init_repo:
	mv include/ ..
	mv lib/ ..
	mv src/ ..
	mv tests/ ..
	mv Makefile ..
	cp ~/.src/SAMPLE_C_PROJECT/.gitignore ..
	cp -r ~/.src/SAMPLE_C_PROJECT/.github ..
