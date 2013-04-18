# -*- mode: shell-script -*-

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="agnoster"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"
#
#

# oh-my-zsh plugins
plugins=(vi-mode tmuxinator bundler rails3 heroku git brews)

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
alias e='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n'
alias dbmigrate='rake db:migrate && rake db:test:prepare'
alias log='~/cl/bin/logtodayone.rb'
alias emacs='/usr/local/Cellar/emacs/24.2/bin/emacs -nw'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
alias ag='nocorrect ag'
alias vims='nocorrect vim -S'
alias b="nocorrect bundle"

if [ -s $HOME/.dirs ]; then
  source $HOME/.dirs
fi

if [ -d ~/bin ]; then
    export PATH=:~/bin:$PATH  # add your bin folder to the path, if you have it.  It's a good place to add all your scripts
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

# customize path

export PATH=/usr/local/bin:$PATH

# rbenv
export PATH="$HOME/.rbenv/bin:.bundle/binstubs:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
eval "$(rbenv init - zsh)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# some custom functions
rake() {
  if [ -S .zeus.sock ]; then
    zeus rake "$@"
  else
    command rake "$@"
  fi
}

rspec() {
  if [ -S .zeus.sock ]; then
    zeus rspec "$@"
  else
    command rspec "$@"
  fi
}

# launch tmux with appropriate config
# as mentioned in https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/issues/8#issuecomment-4134987,
# this might be better as a script
tmux() {
  if [[ "$(uname)" = "Darwin" ]]; then
    command tmux -2 -f ~/.tmux-osx.conf "$@"
  else
    command tmux -2 "$@"
  fi
}

# TODO: move this somewhere less intrusive
if [[ "$(uname)" = "Linux" ]]; then
  # setup ssh-agent on linux machines
  # check to see if SSH Agent is already running
  agent_pid="$(ps -ef | grep "ssh-agent" | grep -v "grep" | awk '{print($2)}')"

  # If the agent is not running (pid is zero length string)
  if [[ -z "$agent_pid"  ]]; then
    # Start up SSH Agent

    # this seems to be the proper method as opposed to `exec ssh-agent bash`
    eval "$(ssh-agent)"

    # if you have a passphrase on your key file you may or may
    # not want to add it when logging in, so comment this out
    # if asking for the passphrase annoys you
    ssh-add

    # If the agent is running (pid is non zero)
  else
    # Connect to the currently running ssh-agent

    # this doesn't work because for some reason the ppid is 1 both when
    # starting from ~/.profile and when executing as `ssh-agent bash`
    #agent_ppid="$(ps -ef | grep "ssh-agent" | grep -v "grep" | awk '{print($3)}')"
    agent_ppid="$(($agent_pid - 1))"

    # and the actual auth socket file name is simply numerically one less than
    # the actual process id, regardless of what `ps -ef` reports as the ppid
    agent_sock="$(find /tmp -path "*ssh*" -type s -iname "agent.$agent_ppid")"

    echo "Agent pid $agent_pid"
    export SSH_AGENT_PID="$agent_pid"

    echo "Agent sock $agent_sock"
    export SSH_AUTH_SOCK="$agent_sock"
  fi
fi
