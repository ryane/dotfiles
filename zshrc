[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dst"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode git fzf gpg-agent gcloud kubectl ssh-agent)

source $ZSH/oh-my-zsh.sh

# User configuration

# use emacs by default
export EDITOR="emacsclient -t"
export ALTERNATE_EDITOR="vim"

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

# aliases
alias g='grep -i'
alias e='emacsclient -n'
alias ec='emacsclient -c -n'
alias et='emacsclient -t'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
alias l='ls'
alias ag='nocorrect ag'
alias vims='nocorrect vim -S'
alias tmuxa="tmux attach -t"
alias batt="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E 'state|to\ full|to\ empty|percentage'"
alias clip="xclip -selection c"
alias xc="xclip -selection clipboard"

# customize the prompt (the oh-my-zsh theme does most of the work)
# prompt_context() {
#     local user=`whoami`

#     if [[ -n "$SSH_CLIENT" ]]; then
#         echo "%{$fg[magenta]%}$user@%m %{$reset_color%}"
#     fi
# }
# PROMPT='$(prompt_context)$(git_custom_status)%{$fg[cyan]%}[%~% ]%{$reset_color%}%B$%b '

# init restic
restic_init() {
    set -a
    if test -f ~/.config/restic-backup.conf; then
        source ~/.config/restic-backup.conf
    fi
    if test -f ~/.config/restic-credentials.conf; then
        source ~/.config/restic-credentials.conf
    fi
    set +a
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Lazyload Node.js - NVM and npm
# https://github.com/ryanhanwu/dotfiles/blob/master/.zshrc#L79
lazynvm() {
  unset -f nvm node npm
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm use default
}

nvm() {
  lazynvm
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}

if [ ! -z "$WSLENV" ]
then
   # TODO: only do the below on wsl hosts
   if [ -z "$DISPLAY" ]
   then
       export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0
   fi
   export LANG=en_US.UTF-8
fi

# git stats

stats_dotfiles() {
  cd ${HOME}/.dotfiles
  git fetch
  local branch
  branch=$(git branch --show-current)
  echo ".dotfiles\t ($(git status -s -uno | wc -l)) $(git rev-list --left-right --count $branch...origin/$branch)"
}

stats_emacsd() {
  cd ${HOME}/.emacs.d
  git fetch
  local branch
  branch=$(git branch --show-current)
  echo ".emacs.d\t ($(git status -s -uno | wc -l)) $(git rev-list --left-right --count $branch...origin/$branch)"
}

stats_doomd() {
  cd ${HOME}/.doom.d
  git fetch
  local branch
  branch=$(git branch --show-current)
  echo ".doom.d\t\t ($(git status -s -uno | wc -l)) $(git rev-list --left-right --count $branch...origin/$branch)"
}

stats_show() {
  echo
  echo " *** Welcome to $(hostname) *** "
  echo
  stats_dotfiles
  stats_emacsd
  stats_doomd
  echo
}

stats_show_maybe() {
  mkdir -p ${HOME}/.local/state/stats-show
  touch ${HOME}/.local/state/stats-show/index

  local count
  count=$(cat ${HOME}/.local/state/stats-show/index)

  let count+=1
  if [[ $count -eq 10 ]]; then
      stats_show
      echo -n 0 > ${HOME}/.local/state/stats-show/index 
  else
      echo -n $count > ${HOME}/.local/state/stats-show/index 
  fi
}

stats_show_maybe
