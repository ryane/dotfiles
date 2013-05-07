# https://github.com/garybernhardt/dotfiles/blob/master/.offlineimap.py

import os

def get_imap_passwd():
  cmd = "/usr/bin/security 2>&1 >/dev/null find-generic-password -s \"Gmail Offlineimap Application Password\" -g"
  line = os.popen(cmd).readline()
  passwds = line.split()
  if len(passwds) == 2:
    return passwds[1][1:-1]
  else:
    return ""
