# Getting the scripts directory
SCRIPTS_DIR=$(dir $(lastword $(MAKEFILE_LIST)))/.scripts

all:
	@echo 'Building dotfiles...'
	@$(SCRIPTS_DIR)/build.sh
	@echo 'dotfiles successfully built!'

install:
	@echo 'Installing dotfiles...'
	@$(SCRIPTS_DIR)/install.sh
	@echo 'dotfiles successfully installed!'

uninstall:
	@echo 'Uninstalling dotfiles...'
	@$(SCRIPTS_DIR)/uninstall.sh
	@echo 'dotfiles successfully uninstalled!'

.PHONY:	all install uninstall
