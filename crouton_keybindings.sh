if type croutonversion &>/dev/null; then
  #If this is a crouton chroot, then swap left ctrl and search keys
  xmodmap -e "keycode 133 = Control_L"
  xmodmap -e "keycode 37 = Overlay1_Enable"
  xmodmap -e "remove mod4 = Control_L"
  xmodmap -e "add control = Control_L"
  xmodmap -e "remove control = Overlay1_Enable"
fi
