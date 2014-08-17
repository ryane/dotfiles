# use this at your own risk
# should be run from the root of the dotfiles dir

args=( "$@" ) # array of all arguments
dotfiles_dir=`pwd`

contains() {
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return $in
}

link_dotfile() {
  dotfile=$1

  if contains args "--skip-$dotfile" ; then
    echo "Skipping $dotfile"
    return 0
  fi

  dest=~/.$dotfile
  if [ ! -e $dest ]; then
    echo "Linking $dest"
    ln -s $dotfiles_dir/$dotfile $dest
  fi
}

# TODO: use authoritative list of dotfiles from somewhere
link_dotfile 'bundle'
link_dotfile 'ackrc'
link_dotfile 'gemrc'
link_dotfile 'gitconfig'
link_dotfile 'githelpers'
link_dotfile 'gitignore'
link_dotfile 'irbrc'
link_dotfile 'muttrc'
link_dotfile 'offlineimaprc'
link_dotfile 'offlineimap.py'
link_dotfile 'pryrc'
link_dotfile 'tmux.conf'
if [ "$(uname)" = "Darwin" ]; then
  link_dotfile 'tmux-osx.conf'
fi
link_dotfile 'vimrc'
link_dotfile 'zshenv'
link_dotfile 'zshrc'
link_dotfile 'zsh'
