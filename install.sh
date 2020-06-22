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
  dest=${2:-~/.$dotfile}

  if contains args "--skip-$dotfile" ; then
    echo "Skipping $dotfile"
    return 0
  fi

  if [ ! -e $dest ]; then
    echo "Linking $dest"
    ln -s $dotfiles_dir/$dotfile $dest
  fi
}

mkdir -p ~/.gnupg
mkdir -p ~/.i3
mkdir -p ~/.mythemes

# TODO: use authoritative list of dotfiles from somewhere
link_dotfile 'gitconfig'
link_dotfile 'githelpers'
link_dotfile 'gitignore'
# link_dotfile 'gnupg/gpg-agent.conf'
# link_dotfile 'i3/config'
# link_dotfile 'pam_environment'
link_dotfile 'tmux.conf'
# link_dotfile 'xprofile'
# link_dotfile 'Xresources'
link_dotfile 'zshrc'
link_dotfile 'zshenv'
link_dotfile 'mythemes/nord'
link_dotfile 'config/ranger/commands.py'
link_dotfile 'config/ranger/rc.conf'
# link_dotfile 'config/rofi'
