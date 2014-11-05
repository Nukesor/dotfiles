# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd extendedglob
unsetopt beep
bindkey -v

source /usr/bin/liquidprompt
# export PROMPT='[%n@%m:%/]%#'
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nukesor/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit

# Aliases
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias lsa='ls -a'
alias lsl='ls -al'
alias grep='grep --color=auto'

alias sys='sudo systemctl'
alias nvim='vim -c NERD'
alias spacman='sudo pacman'
alias mpds='mpd ~/.config/mpd/mpd.conf'
alias music='ncmpcpp -h localhost'
alias pong='ping -D google.de'

# Netctl
alias co='sudo netctl start'
alias disco='sudo netctl stop'

# df Human readable
alias dfh='df -h -x tmpfs'
# Git 
alias glg='git lg'
alias gls='git ls'
alias watchgit='watch -d -n 10 -c git pull'

alias km='killall skype pidgin'

eval `keychain --eval -Q -q id_rsa`
export EDITOR=vim

