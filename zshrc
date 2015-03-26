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

# rbenv
export PATH="$HOME/.rbenv/bin:.bundle/binstubs:$PATH"
eval "$(rbenv init - zsh)"

# oh-my-zsh plugins
plugins=(vi-mode rails heroku git brews)

# custom functions
fpath=(~/.zsh/func $fpath)
autoload -U rake rspec rails_server start-ssh-agent consolidate-path emacs-config mail-status offlineimap-pid offlineimap-kill offlineimap-stop offlineimap-start offlineimap-sync

source $ZSH/oh-my-zsh.sh

# prevent renaming in tmux
export DISABLE_AUTO_TITLE="true"

# use vim by default
export EDITOR="emacsclient -t"
export ALTERNATE_EDITOR="vim"

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
alias dbmigrate='rake db:migrate && rake db:test:prepare'
alias log='~/cl/bin/logtodayone.rb'
alias e='emacsclient -n'
alias ec='emacsclient -c -n'
alias et='emacsclient -t'
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
alias batt="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'state|to\ full|to\ empty|percentage'"

if [ -s $HOME/.dirs ]; then
  source $HOME/.dirs
fi

# moved this to zshenv [2014-02-08 Sat 17:03]
# make sure /usr/local/bin is in the path
# if [ -d /usr/local/bin ]; then
#   export PATH=:/usr/local/bin:$PATH
# fi

# add your bin folder to the path, if you have it.
# It's a good place to add all your scripts
if [ -d ~/bin ]; then
  export PATH=:~/bin:./bin:$PATH
fi

if [  -d ~/.ec2 ]; then
    export EC2_HOME=~/.ec2/ec2-api-tools-1.3-53907
    export EC2_PRIVATE_KEY=~/.ssh/pk-ryanesc-ec2.pem
    export EC2_CERT=~/.ssh/cert-ryanesc-ec2.pem
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
    export PATH=:$EC2_HOME/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
fi

export LEDGER_FILE=~/Dropbox/Documents/Finance/Ledger/main.dat

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### start or connect to ssh-agent on linux machines
### that are not running a Desktop session
### only tested on ubuntu 12.04
[[ "$(uname)" = "Linux" && $DESKTOP_SESSION = "" ]] && start-ssh-agent

# this is from https://github.com/sstephenson/rbenv/issues/369#issuecomment-20910233
# it is giving me major problems since mavericks
# I had to turn it off and
# I had to copy /etc/zshenv to /etc/zprofile and tweak it to clear out the path
# remove duplicate entries from the PATH
# export PATH="$(consolidate-path)"

# customize the prompt (the oh-my-zsh theme does most of the work)
prompt_context() {
  local user=`whoami`

  if [[ -n "$SSH_CLIENT" ]]; then
    echo "%{$fg[magenta]%}$user@%m %{$reset_color%}"
  fi
}
PROMPT='$(prompt_context)$(git_custom_status)%{$fg[cyan]%}[%~% ]%{$reset_color%}%B$%b '

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
