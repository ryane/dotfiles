if type croutonversion &>/dev/null; then
  #If this is a crouton chroot, then swap left ctrl and search keys

  xmodmap -e "keycode 133 = Control_L"
  xmodmap -e "keycode 37 = Overlay1_Enable"
  xmodmap -e "remove mod4 = Control_L"
  xmodmap -e "add control = Control_L"
  xmodmap -e "remove control = Overlay1_Enable"

  # Return should act like a Control key when used as a combo
  # Depends on xcape command also
  xmodmap -e 'keycode 36 = 0x1234'
  xmodmap -e 'add control = 0x1234'
  xmodmap -e 'keycode any = Return'
  # Left control acts as Escape when standalone
  # Return key still works
  if [ ! "$(pidof xcape)" ]
  then
    /usr/local/bin/xcape -t 200 -e 'Control_L=Escape;0x1234=Return'
  fi
fi
