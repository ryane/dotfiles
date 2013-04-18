# use this at your own risk
# should be run from the root of the dotfiles dir

dotfiles_dir=`pwd`

link_dotfile() {
  dotfile=$1
  dest=~/.$dotfile
  if [ ! -e $dest ]; then
    echo "Linking $dest"
    ln -s $dotfiles_dir/$dotfile $dest
  fi
}

link_dotfile 'bundle'
link_dotfile 'ackrc'
link_dotfile 'gitconfig'
link_dotfile 'githelpers'
link_dotfile 'gitignore'
link_dotfile 'irbrc'
link_dotfile 'tmux.conf'
if [ "$(uname)" = "Darwin" ]; then
  link_dotfile 'tmux-osx.conf'
fi
link_dotfile 'vimrc'
link_dotfile 'zshenv'
link_dotfile 'zshrc'
link_dotfile 'zsh'
