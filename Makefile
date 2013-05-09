# Getting the scripts directory
SCRIPTS_DIR=$(dir $(lastword $(MAKEFILE_LIST)))/.scripts

all:
	@echo 'Updating dotfiles...'
	@$(SCRIPTS_DIR)/update.sh

install:
	@echo 'Installing dotfiles...'
	@$(SCRIPTS_DIR)/install.sh

.PHONY:	all install
