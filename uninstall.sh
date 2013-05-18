# use this at your own risk
# should be run from the root of the dotfiles dir

unlink_dotfile() {
  dotfile=$1
  dest=~/.$dotfile
  if [ -h $dest ]; then
    echo "Unlinking $dest"
    rm $dest
  fi
}

# TODO: use authoritative list of dotfiles from somewhere
unlink_dotfile 'bundle'
unlink_dotfile 'ackrc'
unlink_dotfile 'gitconfig'
unlink_dotfile 'githelpers'
unlink_dotfile 'gitignore'
unlink_dotfile 'irbrc'
unlink_dotfile 'offlineimaprc'
unlink_dotfile 'offlineimap.py'
unlink_dotfile 'tmux.conf'
if [ "$(uname)" = "Darwin" ]; then
  unlink_dotfile 'tmux-osx.conf'
fi
unlink_dotfile 'vimrc'
unlink_dotfile 'zshenv'
unlink_dotfile 'zshrc'
unlink_dotfile 'zsh'
