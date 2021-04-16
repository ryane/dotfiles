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

# rust
if [ -d ~/.cargo/bin ]; then
    source "$HOME/.cargo/env"
    export PATH=$PATH:~/.cargo/bin
fi

if [ -d ~/.local/bin ]; then
    export PATH=$PATH:~/.local/bin
fi

# context
if [ -d /opt/context/tex/texmf-linux-64/bin ];then
    export PATH=$PATH:/opt/context/tex/texmf-linux-64/bin
fi
