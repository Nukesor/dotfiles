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
alias rsyncs='rsync -avz --progress '
alias rsync='rsync --recursive --perms --progress --times'

alias km='killall skype pidgin'

# Scripts
alias backlight="source ~/.scripts/backlight.sh"
alias replace="source ~/.scripts/replace.sh"
alias screenshot="source ~/.scripts/screenshot.sh"
alias webogram='source ~/.scripts/webogram.sh'

alias mt="sudo mount"
alias ut="sudo umount"

export EDITOR=vim

eval `keychain --eval --agents "ssh" -Q -q id_rsa`
xset -b

