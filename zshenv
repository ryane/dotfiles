export BROSWER=/usr/bin/chromium

# add your bin folder to the path, if you have it.
# It's a good place to add all your scripts
if [ -d ~/bin ]; then
    export PATH=:~/bin:$PATH
fi

# golang
if [ -d /usr/local/go/bin ]; then
    export PATH=$PATH:/usr/local/go/bin
fi

mkdir -p ~/go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# krew kubernetes plugin manager
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# kubebuilder
if [ -d /usr/local/kubebuilder/bin ]; then
    export PATH=$PATH:/usr/local/kubebuilder/bin
fi
