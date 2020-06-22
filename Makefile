.PHONY: all
all: deps dotfiles

.PHONY: deps
deps:
	mkdir -p mythemes
	curl -sSL https://raw.githubusercontent.com/arcticicestudio/nord-xresources/develop/src/nord -o mythemes/nord

 .PHONY: tmux
tmux:
	@if [ -d "${HOME}/.tmux" ]; then \
		echo "${HOME}/.tmux already exists. Skipping."; \
	else \
		echo "cloning tmux config..."; \
		git clone https://github.com/gpakosz/.tmux.git ~/.tmux; \
		ln -s -f ~/.tmux/.tmux.conf ~/.tmux.conf; \
		cp ~/.tmux/.tmux.conf.local ~; \
	fi

.PHONY: dotfiles
dotfiles:
	@./install.sh

.PHONY: uninstall
uninstall:
	@./uninstall.sh
