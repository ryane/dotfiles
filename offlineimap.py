# https://github.com/garybernhardt/dotfiles/blob/master/.offlineimap.py

import re, os

def get_imap_passwd():
  cmd = "/usr/bin/security 2>&1 >/dev/null find-generic-password -s \"Gmail Offlineimap Application Password\" -g"
  line = os.popen(cmd).readline()
  passwds = line.split()
  if len(passwds) == 2:
    return passwds[1][1:-1]
  else:
    return ""

def get_auth_info_pw(machine, login, port):
  s = "machine %s login %s port %s password ([^ ]*)\n" % (machine, login, port)
  p = re.compile(s)
  authinfo = os.popen("/usr/local/bin/gpg -q --no-tty -d ~/.authinfo.gpg").read()
  return p.search(authinfo).group(1)
