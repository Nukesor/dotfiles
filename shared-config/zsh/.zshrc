#zgen stuff
source "$ZDOTDIR/zgen/zgen.zsh"
source "/usr/share/fzf/key-bindings.zsh"
source "/usr/share/fzf/completion.zsh"

autoload -U compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump

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
autoload -U compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump
autoload -U promptinit && promptinit

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE
setopt inc_append_history   # write to history immediately
setopt hist_ignore_dups     # ignore second instance of same event
setopt share_history        # share history between session
setopt extended_history     # special history format with timestamp
setopt no_hist_beep         # fucking beep
setopt hist_ignore_space    # ignore entries with leading space

#Syntax Highlighting
ZSH_HIGHLIGHT_STYLES[globbing]='fg=002,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=002,bold'

# Aliases
alias ls='ls --color=auto'
alias lh='ls -lh'
alias la='ls -alh'
alias grep='grep --color=auto'

# fasd
eval "$(fasd --init auto)"
alias j='fasd_cd -d'

#Various
alias sys='sudo systemctl'
alias systatus='systemctl --type=service --all'
alias logs='sudo journalctl -f'
alias dstat='dstat -tdnclmpry'
alias pong='ping -D google.de'
alias spacman='sudo pacman'
alias mksrcinfo='updpkgsums && makepkg --printsrcinfo > .SRCINFO'
alias watch='watch -c'
alias rsync='rsync --recursive --partial --perms --progress'
alias arsync='rsync -a --partial --perms --progress'
alias sdi='/usr/bin/sd'

# Vim
alias nvim='vim -c NERD'
alias svim='sudo nvim'
alias vimupdate='vim +Pluginstall +qall'

# Netctl
alias co='sudo netctl stop-all && sudo netctl start'
alias disca='sudo netctl stop-all'

# df Human readable
alias dfh='df -h -x tmpfs'
alias duh='du -ahl -d 1 | sort -h'
alias dud='du -ahl -d 0'

# Git
alias gb='git branch'
alias glg='git lg'
alias gcm='git commit -m'
alias gls='git ls'
alias gpu='git push origin -u'
alias gpo='git remote prune origin'

#Tmux
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
alias tew='tmux new -s'
alias tat='tmux attach -t'
alias till='tmux kill-session -t'

#Pueue and encarne
alias pad='pueue add --'
alias pst='pueue status'
alias pt='pueue show | tail'

# Youtube dl
alias yd='youtube-dl -f bestvideo+bestaudio --output "%(title)s.%(ext)s"'
alias ydp='youtube-dl -f bestvideo+bestaudio --output "%(playlist_index)s-%(title)s.%(ext)s"'
alias ym='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --output "%(title)s.%(ext)s"'

[[ -r $ZDOTDIR/zshrc-client ]] && source $ZDOTDIR/zshrc-client
[[ -r $ZDOTDIR/zshrc-work   ]] && source $ZDOTDIR/zshrc-work
[[ -r $ZDOTDIR/zshrc-server ]] && source $ZDOTDIR/zshrc-server

# Stage files multi-selected modified files
__gflist() {
    local files=$(git ls-files -m)
    local selection=( $($(__fzfcmd) -m \
        --preview 'git diff --color {} | diff-so-fancy' \
        --preview-window up:60%  \
        --bind=ctrl-j:down,ctrl-k:up,ctrl-l:preview-down,ctrl-h:preview-up,q:abort <<< $files) )

    LBUFFER="${LBUFFER} ${selection}"
    local ret=$?
    return $ret
}

function printuni() {
    file=$1
    printer='g122_fa4'
#    printer='g122_sw4'
    read "answer?Are you sure you want to print ${file} on ${printer}? (y/n):"
    if [[ $answer == 'y' ]] ; then
        echo 'Ok, printing'
        cat "$file" | ssh 2beer@rzh lpr -P$printer -o sides=one-sided
    else
        echo 'Ok, not printing'
    fi
}

# Bind it to CTRL-g
zle -N __gflist
bindkey "^g" __gflist

eval `keychain --eval --agents 'ssh' -Q -q id_rsa`

export TERM='xterm-256color'
