#!/bin/bash

# add this to .profile or somewhere else that will run on login. there might be
# a better place to run it - we'll see if it causes issues when logging in over
# ssh. For example:

# . "$HOME/.dotfiles/ubuntu_keybindings.sh"

# set -ex

echo "ubuntu_keybindings: starting" >> /tmp/ubuntu_keybindings.log

# make caps lock an additional control
# there might be more modern ways to do this, but this works for me and keeps my key bindings in one place
echo "ubuntu_keybindings: swapping caps lock and control" >> /tmp/ubuntu_keybindings.log
xmodmap -e 'keycode 66 = Control_L'
xmodmap -e 'clear Lock'
xmodmap -e 'add Control = Control_L'

# Return should act like a Control key when used as a combo
# Depends on xcape command also
echo "ubuntu_keybindings: configuring return to act as control" >> /tmp/ubuntu_keybindings.log
xmodmap -e 'keycode 36 = 0x1234'
xmodmap -e 'add control = 0x1234'
xmodmap -e 'keycode any = Return'

# Left control acts as Escape when standalone
# Return key still works
echo "ubuntu_keybindings: running xcape" >> /tmp/ubuntu_keybindings.log
killall xcape || true
xcape -t 200 -e 'Control_L=Escape;0x1234=Return'

echo "ubuntu_keybindings: done" >> /tmp/ubuntu_keybindings.log
