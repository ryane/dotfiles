# dotfiles

Note: these notes are for my own reference purposes. Use at your own peril.

## Dependencies

* rbenv (https://github.com/sstephenson/rbenv/)
* oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)
* Vundle (https://github.com/gmarik/vundle)

## Install on a new machine

### Install rbenv

    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv

### Install oh-my-zsh

    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

### Install Vundle

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

### Get Tomorrow Theme

    mkdir -p ~/.vim/colors
    pushd ~/.vim/colors
    curl -O https://raw.github.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow-Night-Blue.vim
    curl -O https://raw.github.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow-Night-Bright.vim
    curl -O https://raw.github.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow-Night-Eighties.vim
    curl -O https://raw.github.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow-Night.vim
    curl -O https://raw.github.com/chriskempson/vim-tomorrow-theme/master/colors/Tomorrow.vim
    popd

### Install dotfiles

    git clone https://github.com/ryane/dotfiles
    cd dotfiles
    ./install.sh
    vim +BundleInstall +qall

## Home directory configuration files

### ackrc

### gitignore

### githelpers

This was poached from https://github.com/garybernhardt/dotfiles/blob/master/.githelpers

### gitconfig

### irbrc

### tmux.conf

### tmux-osx.conf

Some OSX specific settings for tmux. Loading it depends on a shell script in the path before the actual tmux binary. See https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/issues/8#issuecomment-4134987

### vimrc

### zshenv

### zshrc

### zsh
