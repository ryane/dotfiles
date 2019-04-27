.PHONY: all
all: deps dotfiles

.PHONY: deps
deps:
	mkdir -p mythemes
	curl -sSL https://raw.githubusercontent.com/arcticicestudio/nord-xresources/develop/src/nord -o mythemes/nord

.PHONY: dotfiles
dotfiles:
	@./install.sh

.PHONY: uninstall
uninstall:
	@./uninstall.sh
