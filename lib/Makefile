##
## EPITECH PROJECT, 2021
## LIBMY
## File description:
## make the libmy
##

# ----------------------------------------------------------------------------
# TARGET
NAME		:=	libmy.a
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# COLOUR
CYAN		:=	'\033[0;36m'
GREEN 		:= 	'\033[0;32m'

RESET		:=	'\033[0m'
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# IN-MAKEFILE SETTINGS
CURR_RULE	=	all
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# SUBMODULE LIB
LIB_CONVERSION	:=	conversions/
LCONVERSION	:=	$(LIB_CONVERSION)libconv.a

LIB_FS		:=	fs/
LFS		:=	$(LIB_FS)libfs.a

LIB_PUTS	:=	puts/
LPUTS		:=	$(LIB_PUTS)libputs.a

LIB_STRINGS	:=	strings/
LSTRINGS	:=	$(LIB_STRINGS)libstr.a

LIB_WORDARRAY	:=	wordarray/
LWORDARRAY	:=	$(LIB_WORDARRAY)libwa.a
# ----------------------------------------------------------------------------

.PHONY: all
all:	CURR_RULE = all
all:	init $(LFS) $(LPUTS) $(LSTRINGS) $(LWORDARRAY) $(LCONVERSION) $(NAME)
	@echo -e $(GREEN)' -> [finished]: $(NAME): make $(CURR_RULE)'$(RESET)

$(NAME):
	ar rcT $(NAME) $(LFS) $(LPUTS) $(LSTRINGS) $(LWORDARRAY) \
		$(LCONVERSION)
	ranlib $(NAME)

$(LFS):
	$(MAKE) -C $(LIB_FS) all -s

$(LPUTS):
	$(MAKE) -C $(LIB_PUTS) all -s

$(LSTRINGS):
	$(MAKE) -C $(LIB_STRINGS) all -s

$(LWORDARRAY):
	$(MAKE) -C $(LIB_WORDARRAY) all -s

$(LCONVERSION):
	$(MAKE) -C $(LIB_CONVERSION) all -s

.PHONY: init
init:
	@echo -e $(CYAN)' -> [starting]: $(NAME): make $(CURR_RULE)'$(RESET)

.PHONY: clean
clean: 	CURR_RULE = clean
clean:	init
	@echo -e $(GREEN)' -> [finished]: $(NAME): make $(CURR_RULE)'$(RESET)

.PHONY: fclean
fclean: CURR_RULE = fclean
fclean:	init
	@$(MAKE) clean -s
	$(MAKE) -C $(LIB_FS) fclean -s
	$(MAKE) -C $(LIB_PUTS) fclean -s
	$(MAKE) -C $(LIB_STRINGS) fclean -s
	$(MAKE) -C $(LIB_WORDARRAY) fclean -s
	$(MAKE) -C $(LIB_CONVERSION) fclean -s
	@rm -f $(NAME)
	@echo -e $(GREEN)' -> [finished]: $(NAME): make $(CURR_RULE)'$(RESET)

.PHONY: re
re:	fclean all
