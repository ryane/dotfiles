# -*- mode: shell-script -*-

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
plugins=(vi-mode rails heroku git brews kube-ps1)

# custom functions
fpath=(~/.zsh/func $fpath)
autoload -U rake rspec rails_server start-ssh-agent consolidate-path emacs-config mail-status offlineimap-pid offlineimap-kill offlineimap-stop offlineimap-start offlineimap-sync _kubectx _kubens

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
# alias docker-cleanup="docker rm $(docker ps -aq); docker rmi $(docker images | grep '^<none>' | awk '{print $3}')"
alias clip="xclip -selection c"

alias y2j='yaml2json'
alias kc='kubectl'
alias kcg='kubectl get --show-labels'
alias kcd='kubectl describe'
alias kcl='kubectl logs'
alias kail="docker run --rm -it -v ~/.kube:/root/.kube -v /etc/hosts:/etc/hosts abozanich/kail"

if [ -s $HOME/.dirs ]; then
  source $HOME/.dirs
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

### start or connect to ssh-agent on linux machines

### only tested on ubuntu 12.04
# [[ "$(uname)" = "Linux" && $DESKTOP_SESSION = "" ]] && start-ssh-agent

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

if [ -d ~/Projects/google-cloud-sdk ];
then
    # The next line updates PATH for the Google Cloud SDK.
    source ~/Projects/google-cloud-sdk/path.zsh.inc
    # The next line enables shell command completion for gcloud.
    source ~/Projects/google-cloud-sdk/completion.zsh.inc
fi

# added by travis gem
[ -f /Users/ryan/.travis/travis.sh ] && source /Users/ryan/.travis/travis.sh

# [[ "$(uname)" = "Linux" ]] && export TERM=xterm-256color

if [ "$(uname)" = "Darwin" ];
then
    # ssh agent
    start-ssh-agent

    # gpg agent
    if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
        source ~/.gnupg/.gpg-agent-info
        export GPG_AGENT_INFO
        export GPG_TTY=$(tty)
    else
        eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
    fi

fi

export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

 #kubectl shell autocompletion
which kubectl > /dev/null 2>&1 && source <(kubectl completion zsh)
