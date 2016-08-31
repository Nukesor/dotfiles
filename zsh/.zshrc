#zgen stuff
source "$HOME/.zsh/zgen.zsh"
source "/usr/share/fzf/key-bindings.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load robbyrussell/oh-my-zsh plugins/colored-man
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load nojhan/liquidprompt
    zgen load chrissicool/zsh-256color
    zgen load zsh-users/zsh-completions src

    zgen save
fi


# General configuration
autoload -U compinit && compinit
autoload -U promptinit && promptinit

setopt autocd               # cd without writing cd
setopt extended_glob        # extended glob syntax
setopt nomatch              # print error if pattern matches nothing
setopt notify               # report status of background jobs immediately
setopt nohashdirs           # disable hashing of dirs so we don't have to run
                            # rehash after installing new binaries (performance hit?)
# History
HISTFILE=~/.zsh_history
HISTSIZE=8000
SAVEHIST=$HISTSIZE
setopt inc_append_history   # write to history immediately
setopt hist_ignore_dups     # ignore second instance of same event
setopt share_history        # share history between session
setopt extended_history     # special history format with timestamp
setopt no_hist_beep         # fucking beep
setopt hist_ignore_space    # ignore entries with leading space


# Completion

setopt complete_in_word     # complete from both ends of a word
setopt always_to_end        # move cursor to the end of a completed word
setopt path_dirs            # perform path search even on command names with slashes
setopt auto_menu            # show completion menu on a succesive tab press
setopt auto_list            # automatically list choices on ambiguous completion
setopt auto_param_slash     # if completed parameter is a directory, add a trailing slash
unsetopt menu_complete      # do not autoselect the first completion entry
unsetopt flow_control       # disable start/stop characters in shell editor

## Group matches and describe.
# zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

## Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

## Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

## History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

#Syntax Highlighting
ZSH_HIGHLIGHT_STYLES[globbing]='fg=002,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=002,bold'

# Aliases
alias ls='ls --color=auto'
alias lsa='ls -alh'
alias lsl='ls -lh'
alias lsr='ls -alhR'
alias grep='grep --color=auto'

# fasd
eval "$(fasd --init auto)"
alias j='fasd_cd -d'

#Various
alias sys='sudo systemctl'
alias systatus='systemctl --type=service --all'
alias hate='sudo killall -9'
alias logs='sudo journalctl -f'
alias spacman='sudo pacman'
alias updateall='sudo pacman -Syu --noconfirm && zgen update'
alias pong='ping -D google.de'

# Vim
alias nvim='vim -c NERD'
alias svim='sudo nvim'

# Netctl
alias co='sudo netctl stop-all && sudo netctl start'
alias disco='sudo netctl stop'

# df Human readable
alias dfh='df -h -x tmpfs'
alias dud='du -ah -d 1'
alias dirsize='du -ahl -d 0'

# Git
alias glg='git lg'
alias gls='git ls'
alias gpu='git push origin -u'
alias gpo='git remote prune origin'
alias watchgit='watch -d -n 5 -c git pull'
alias rsync='rsync --recursive --partial --perms --progress'
alias prsync='rsync --owner --group --perms --recursive --partial --progress'
alias ursync='rsync --update'

#Tmux
alias tew='tmux new -s'
alias tat='tmux attach -t'
alias tet='tmux detach'
alias tend='tmux send -t'
alias till='tmux kill-session -t'

#SSH
alias ssh="TERM='xterm-256color' ssh"

#whatmp3
alias mp3='mkdir -p ~/converted && whatmp3 --notorrent -L -w --V0 -o ~/converted'

#Pueue
alias pad='pueue add'

if [[ "$USER" = "root" ]]; then
    PATH=$PATH:/root/.scripts/
else
    PATH=$PATH:/home/$USER/.scripts/
fi

[[ -r $HOME/.zshrc-client ]] && source $HOME/.zshrc-client
[[ -r $HOME/.zshrc-work   ]] && source $HOME/.zshrc-work
[[ -r $HOME/.zshrc-server ]] && source $HOME/.zshrc-server

eval `keychain --eval --agents 'ssh' -Q -q id_rsa`
eval "$(dircolors -b ~/.dircolors)"
