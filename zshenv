# make sure /usr/local/bin is in the path
if [ -d /usr/local/bin ]; then
  export PATH=:/usr/local/bin:$PATH
fi
