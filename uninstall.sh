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
unlink_dotfile 'gitconfig'
unlink_dotfile 'githelpers'
unlink_dotfile 'gitignore'
unlink_dotfile 'gnupg/gpg-agent.conf'
unlink_dotfile 'pam_environment'
unlink_dotfile 'tmux.conf'
unlink_dotfile 'xprofile'
unlink_dotfile 'Xresources'
unlink_dotfile 'zshrc'
unlink_dotfile 'zshenv'
unlink_dotfile 'mythemes/nord'

rm -rf ~/.mythemes
