# -*- mode: shell-script -*-

# make sure /usr/local/(s)bin is in the path
if [ -d /usr/local/bin ]; then
  export PATH=:/usr/local/bin:$PATH
fi

if [ -d /usr/local/sbin ]; then
    export PATH=:/usr/local/sbin:$PATH
fi

# add your bin folder to the path, if you have it.
# It's a good place to add all your scripts
if [ -d ~/bin ]; then
    export PATH=:~/bin:./bin:$PATH
fi

# rbenv
# [2016-08-18 Thu 11:56] haven't been using it for a while
# if [ -d /usr/local/rbenv ]; then
#     export RBENV_ROOT=/usr/local/rbenv
#     export PATH="$RBENV_ROOT/bin:$PATH"
#     eval "$(rbenv init - zsh --no-rehash)"
# elif [ -d $HOME/.rbenv ]; then
#     export PATH="$HOME/.rbenv/bin:.bundle/binstubs:$PATH"
#     eval "$(rbenv init - zsh --no-rehash)"
# fi

# golang
if [ -d /usr/local/go/bin ]; then
  export PATH=$PATH:/usr/local/go/bin
fi

if [ -d ~/Projects/golang ]; then
    export GOPATH=~/Projects/golang
    export PATH=$PATH:$GOPATH/bin
fi

# Heroku Toolbelt
if [ -d /usr/local/heroku/bin ]; then
    export PATH="/usr/local/heroku/bin:$PATH"
fi

# i3 on xps13/linux settings
if [ "$DESKTOP_SESSION" = "i3" ];
then
    # useful screen res on xps13 [2016-07-24 Sun 22:40]
    xrandr --output eDP1 --mode 2048x1152

    # setup keybings [2016-07-24 Sun 22:40]
    /home/ryan/.dotfiles/ubuntu_keybindings.sh

    # setup mouse buttons
    xinput set-button-map 12 1 1 3 4 5 6 7

    # setup ssh-agent
    export $(gnome-keyring-daemon -s)
fi
