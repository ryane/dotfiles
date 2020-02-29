export BROSWER=/usr/bin/chromium

# add your bin folder to the path, if you have it.
# It's a good place to add all your scripts
if [ -d ~/bin ]; then
	export PATH=:~/bin:$PATH
fi

# golang
mkdir -p ~/go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# krew kubernetes plugin manager
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
