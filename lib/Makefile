##
## EPITECH PROJECT, 2021
## LIBMY
## File description:
## make the libmy
##

# ----------------------------------------------------------------------------
# TARGET
NAME		=	libmy.a
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
LCONVERSION	:=	conversions/libconv.a

LFS			:=	fs/libfs.a

LPUTS		:=	puts/libputs.a

LSTRINGS	:=	strings/libstr.a

LWORDARRAY	:=	wordarray/libwa.a
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Make big libmy
.PHONY: all
all:	CURR_RULE = all
all:	init $(LFS) $(LPUTS) $(LSTRINGS) $(LWORDARRAY) $(LCONVERSION) $(NAME)
	@echo -e $(GREEN)' -> [finished]: $(NAME): make $(CURR_RULE)'$(RESET)

$(NAME):
	ar rcT $(NAME) $(LFS) $(LPUTS) $(LSTRINGS) $(LWORDARRAY) \
		$(LCONVERSION)
	ranlib $(NAME)
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Call Make of sub-lib
$(LFS):
	$(MAKE) -C $(dir $(LFS)) all -s

$(LPUTS):
	$(MAKE) -C $(dir $(LPUTS)) all -s

$(LSTRINGS):
	$(MAKE) -C $(dir $(LSTRINGS)) all -s

$(LWORDARRAY):
	$(MAKE) -C $(dir $(LWORDARRAY)) all -s

$(LCONVERSION):
	$(MAKE) -C $(dir $(LCONVERSION)) all -s
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
.PHONY: clean
clean: 	CURR_RULE = clean
clean:	init
	@echo -e $(GREEN)' -> [finished]: $(NAME): make $(CURR_RULE)'$(RESET)

.PHONY: fclean
fclean: CURR_RULE = fclean
fclean:	init
	@$(MAKE) clean -s
	@$(MAKE) -C $(dir $(LFS)) fclean -s
	@$(MAKE) -C $(dir $(LPUTS)) fclean -s
	@$(MAKE) -C $(dir $(LSTRINGS)) fclean -s
	@$(MAKE) -C $(dir $(LWORDARRAY)) fclean -s
	@$(MAKE) -C $(dir $(LCONVERSION)) fclean -s
	@$(RM) $(NAME)
	@echo -e $(GREEN)' -> [finished]: $(NAME): make $(CURR_RULE)'$(RESET)
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
.PHONY: re
re:
	@$(MAKE) fclean -s
	@$(MAKE) all -s
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
.PHONY: init
init:
	@echo -e $(CYAN)' -> [starting]: $(NAME): make $(CURR_RULE)'$(RESET)
# ----------------------------------------------------------------------------
