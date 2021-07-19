# -------------------- External plugin init --------------------
source "$ZDOTDIR/zgen/zgen.zsh"
if [[ -f "/usr/share/fzf/key-bindings.zsh" ]]; then
    source "/usr/share/fzf/key-bindings.zsh"
fi
if [[ -f "/usr/share/fzf/completion.zsh" ]]; then
    source "/usr/share/fzf/completion.zsh"
fi

autoload -U compinit && compinit -d $HOME/.cache/zsh/zcompdump

# -------------------- Packages --------------------
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load robbyrussell/oh-my-zsh plugins/colored-man
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load nojhan/liquidprompt
    zgen load chrissicool/zsh-256color
    #zgen load zsh-users/zsh-completions src

    zgen save
fi


# -------------------- General configuration --------------------
autoload -U promptinit && promptinit

#Syntax Highlighting
ZSH_HIGHLIGHT_STYLES[globbing]='fg=002,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=002,bold'

# -------------------- Aliases --------------------
#Various
alias dstat='dstat -tdnclmpry'
alias pong='ping -D google.de'
alias spacman='sudo pacman'
alias mksrcinfo='updpkgsums && makepkg --printsrcinfo > .SRCINFO'
alias watch='watch -c'
alias sdi='/usr/bin/sd'

# Systemctl
alias sys='sudo systemctl'
alias systatus='systemctl --type=service --all'
alias logs='sudo journalctl -u'

# Rsync
alias rsync='rsync --recursive --partial --perms --progress'
alias arsync='rsync -a --partial --perms --progress'

# Ls
alias ls='ls --color=auto'
alias lh='ls -lh'
alias la='ls -alh'

# cp
alias cp='cp --reflink=auto'

# fasd
eval "$(fasd --init auto)"
alias j='fasd_cd -d'

# Tar
alias tarz='tar -I zstd -cvf'
alias untarz='tar -I zstd -xvf'

# Vim
alias nvim='vim -c NERD'
alias svim='sudo nvim'

# Netctl
alias co='sudo netctl stop-all && sudo netctl start'
alias disca='sudo netctl stop-all'

# dust default Human readable
alias dud='dust -d1'

# Git
alias gb='git branch'
alias glg='git lg'
alias gcm='git commit -m'
alias gls='git ls'
alias gpu='git push origin -u'
alias gpo='git remote prune origin'
alias git_describe="git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'"

#Tmux
if [[ -f "$HOME/.config/tmux/tmux.conf" ]]; then
    alias tmux="tmux -f $HOME/.config/tmux/tmux.conf"
fi
alias tew='tmux new -s'
alias tat='tmux attach -t'
alias till='tmux kill-session -t'

#Docker
alias dcu='docker-compose up'

#Pueue
alias p='pueue'
alias pad='pueue add --'
alias padh='pueue add -g hdd --'
alias padc='pueue add -g cpu --'
alias pst='pueue status'
alias pt='pueue follow'

# Youtube dl
alias yd='youtube-dl -f best --output "%(title)s.%(ext)s"'
alias ydp='youtube-dl -f best --output "%(playlist_index)s-%(title)s.%(ext)s"'
alias ym='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --output "%(title)s.%(ext)s"'

# Json formatting
alias jsonformat='python -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=4))" <'

# Python
alias venv="source .venv/bin/activate"

# Taskwarrior
alias tl='clear && task calendar && task'
alias tui='taskwarrior-tui'

# Trans
alias t="trans de:en"
alias td="trans :de"

[[ -r $ZDOTDIR/zshrc-client ]] && source $ZDOTDIR/zshrc-client
[[ -r $ZDOTDIR/zshrc-work   ]] && source $ZDOTDIR/zshrc-work
[[ -r $ZDOTDIR/zshrc-server ]] && source $ZDOTDIR/zshrc-server

# -------------------- Custom functions--------------------
# Stage files multi-selected modified files
__gflist() {
    local files=$(git ls-files -m -o -d --exclude-standard | uniq)
    local selection=( $($(__fzfcmd) -m \
        --preview 'git diff --color {} | diff-so-fancy' \
        --preview-window up:60%  \
        --bind=ctrl-n:preview-down,ctrl-p:preview-up,q:abort,tab:toggle,ctrl-i:toggle,ctrl-o:toggle-preview <<< $files) )

    LBUFFER="${LBUFFER} ${selection}"
    local ret=$?
    return $ret
}

# -------------------- Key bindings --------------------
# Bind it to CTRL-g
zle -N __gflist
bindkey "^g" __gflist

# -------------------- Other stuff --------------------
export TERM='xterm-256color'
if [[ -f ~/.ssh/id_ed25519 ]]; then
    eval `keychain --eval --agents 'ssh' -Q -q id_ed25519`
elif [[ -f ~/.ssh/id_rsa ]]; then
    eval `keychain --eval --agents 'ssh' -Q -q id_rsa`
fi

# History
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
setopt inc_append_history   # write to history immediately
setopt hist_ignore_dups     # ignore second instance of same event
setopt share_history        # share history between session
setopt extended_history     # special history format with timestamp
setopt no_hist_beep         # fucking beep
setopt hist_ignore_space    # ignore entries with leading space
