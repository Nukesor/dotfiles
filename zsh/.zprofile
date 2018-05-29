HISTSIZE=50000

eval $(dircolors $HOME/.dircolors)
path=($HOME/.scripts/ $path)
path=($HOME/.cargo/bin $path)
path=($HOME/go/bin $path)
path=(./bin $path)
GOPATH="$HOME/go"

fpath=($HOME/.dotfiles/zshcompletion/ $fpath)

eval $(dircolors ~/.dircolors)
