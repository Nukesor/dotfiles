HISTSIZE=50000

eval $(dircolors $HOME/.dircolors)
path=($path $HOME/.scripts/)
path=($path $HOME/.cargo/bin)
path=($path ./bin)
path=($path ./node_modules/.bin)

fpath=($fpath $HOME/.dotfiles/zshcompletion/)

eval $(dircolors ~/.dircolors)
