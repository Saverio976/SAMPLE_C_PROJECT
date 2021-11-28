##
## EPITECH PROJECT, 2021
## sample
## File description:
## sample description
##

TARGET		=	...

LIB_TARGET	=	lib/libmy.a

TARGET_TEST	=	bin_test

SRCDIR		=	src/

OBJDIR		=	obj/

VPATH		=	$(SRCDIR) $(OBJDIR) lib/ include/ tests/

SRC		:=	$(wildcard $(SRCDIR)*.c)
SRC		:=	$(filter-out $(SRCDIR)main.c, $(SRC))

OBJ		:=	$(SRC:%.c=%.o)
OBJ		:=	$(addprefix $(OBJDIR), $(notdir $(OBJ)))

MAIN_SRC	=	$(SRCDIR)main.c

MAIN_OBJ	:=	$(MAIN_SRC:%.c=%.o)
MAIN_OBJ	:=	$(addprefix $(OBJDIR), $(notdir $(MAIN_OBJ)))

TEST_SRC	= 	$(wildcard tests/*.c)

TEST_OBJ	:=	$(TEST_SRC:%.c=%.o)
TEST_OBJ	:=	$(addprefix $(OBJDIR), $(notdir $(TEST_OBJ)))

CFLAGS		= 	-Iinclude/ -Ilib/include/ -Wall -Wextra -Wpedantic

LFLAGS		=	-Llib/ -lmy

CR_TEST_FLAGS	=	-lcriterion

FN_TEST_FLAGS	=	-ftest-coverage -fprofile-arcs

# ----------------------------------------------------------------------------

$(OBJDIR)%.o: %.c
	$(CC)     $(CFLAGS)    $^ -c -o $@

.PHONY: all
all:	$(LIB_TARGET) $(TARGET) ## Build lib+binary

$(TARGET):	$(OBJ) $(MAIN_OBJ) ## Build the binary
	$(CC) $(OBJ) $(MAIN_OBJ) -o $(TARGET) $(LFLAGS)

$(LIB_TARGET): ## Build the lib
	$(MAKE) -C lib/

.PHONY: clean
clean: ## Clean obj and gcno/gcda
	rm -f $(OBJDIR)*.o
	rm -f **/*.gcno **/*.gcda

.PHONY: fclean
fclean:	clean ## Clean+Remove target/target_test and call lib fclean
	$(MAKE) -C lib/ fclean -s
	rm -f $(TARGET) $(TARGET_TEST)

.PHONY: re
re:	fclean all ## Fclean+All

.PHONY: tests_run
tests_run: cr_tests_run ## The rule called by Marvin to make coverage

.PHONY: cr_tests_run
cr_tests_run: CFLAGS += --coverage ## Criterion tests
cr_tests_run: build_lib $(OBJ) $(TEST_OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(TEST_OBJ) -o $(TARGET_TEST) $(LFLAGS) \
		$(CR_TEST_FLAGS)
	./$(TARGET_TEST)
	gcovr --exclude tests/
	gcovr --exclude tests/ --branch

.PHONY: sanitize_tests_run
sanitize_tests_run: CFLAGS += -fsanitize=address fsanitize=leak
sanitize_tests_run: CFLAGS += -fsanitize=undefined
sanitize_tests_run: all

.PHONY: fn_tests_run
fn_tests_run: CFLAGS += $(FN_TEST_FLAGS) ## Fonctional tests
fn_tests_run: $(OBJ) $(MAIN_OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(MAIN_OBJ) -o $(TARGET_TEST) $(LFLAGS)
	./tests/fn_tests.sh ./$(TARGET_TEST)
	gcov $(TARGET_TEST)
	gcovr --exclude tests/
	gcovr --exclude tests/ --branch