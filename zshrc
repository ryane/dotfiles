# -*- mode: shell-script -*-

# [[ "$(uname)" = "Linux" ]] && export TERM=xterm-256color

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="eastwood"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"
#
#

# oh-my-zsh plugins
plugins=(vi-mode rails3 heroku git brews git-flow)

# custom functions
fpath=(~/.zsh/func $fpath)
autoload -U rake rspec rails_server start-ssh-agent consolidate-path emacs-config

source $ZSH/oh-my-zsh.sh

# prevent renaming in tmux
export DISABLE_AUTO_TITLE="true"

# use vim by default
export EDITOR="vim"

# stop the annoying corrections
unsetopt correct_all

# vi mode
# re-enable some useful bindings
bindkey '^P' up-history
bindkey '^N' down-history

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

bindkey "^F" vi-cmd-mode
bindkey jk vi-cmd-mode

setopt hist_ignore_all_dups

alias g='grep -i'
# alias e='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n'
alias dbmigrate='rake db:migrate && rake db:test:prepare'
alias log='~/cl/bin/logtodayone.rb'
# alias emacs='/usr/local/Cellar/emacs/24.2/bin/emacs -nw'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
alias l='ls'
alias ag='nocorrect ag'
alias vims='nocorrect vim -S'
alias b="nocorrect bundle"
alias be="bundle exec"
alias bi="bundle install"
alias bl="bundle list"
alias bp="bundle package"
alias bu="bundle update"
alias tmuxa="tmux attach -t"

if [ -s $HOME/.dirs ]; then
  source $HOME/.dirs
fi

# make sure /usr/local/bin is in the path
if [ -d /usr/local/bin ]; then
  export PATH=:/usr/local/bin:$PATH
fi

# add your bin folder to the path, if you have it.
# It's a good place to add all your scripts
if [ -d ~/bin ]; then
  export PATH=:~/bin:$PATH
fi

if [  -d ~/.ec2 ]; then
    export EC2_HOME=~/.ec2/ec2-api-tools-1.3-53907
    export EC2_PRIVATE_KEY=~/.ssh/pk-ryanesc-ec2.pem
    export EC2_CERT=~/.ssh/cert-ryanesc-ec2.pem
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
    export PATH=:$EC2_HOME/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

# fix for emacs tramp mode
if [ "$TERM" = "dumb" ]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  unfunction precmd
  unfunction preexec
  PS1='$ '
fi

export LEDGER_FILE=~/Documents/finance/ledger/main.dat

# open man page in Preview.app
# http://superuser.com/questions/52483/terminal-tips-and-tricks-for-mac-os-x
pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

# na
# https://github.com/ttscoff/na
[[ -s "/Users/ryan/bin/na.sh" ]] && source "/Users/ryan/bin/na.sh"

# tmuxinator
# https://github.com/aziz/tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# rbenv
export PATH="$HOME/.rbenv/bin:.bundle/binstubs:$PATH"
eval "$(rbenv init - zsh)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### start or connect to ssh-agent on linux machines
### that are not running a Desktop session
### only tested on ubuntu 12.04
[[ "$(uname)" = "Linux" && $DESKTOP_SESSION = "" ]] && start-ssh-agent

# remove duplicate entries from the PATH
export PATH="$(consolidate-path)"
