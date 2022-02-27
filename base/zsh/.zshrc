# -------------------- External plugin init --------------------
if [[ -f "/usr/share/fzf/key-bindings.zsh" ]]; then
    source "/usr/share/fzf/key-bindings.zsh"
fi
if [[ -f "/usr/share/fzf/completion.zsh" ]]; then
    source "/usr/share/fzf/completion.zsh"
fi

autoload -U compinit && compinit -d $HOME/.cache/zsh/zcompdump

# -------------------- Packages --------------------
export ZPLUG_BIN="$HOME/.local/share/zplug/bin"
export ZPLUG_HOME="$HOME/.local/share/zplug"
export ZPLUG_REPOS="$HOME/.local/share/zplug"
export ZPLUG_CACHE_DIR="$HOME/.cache/zplug"

source /usr/share/zsh/scripts/zplug/init.zsh

zplug "chrissicool/zsh-256color"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
#zplug "zsh-users/zsh-completions" use:src

zplug load

# Run "zplug install" if not all plugins are installed.
zplug check || zplug install

eval "$(starship init zsh)"

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

# Vim
alias nvim='vim -c NERD'
alias svim='sudo nvim'

# Netctl
alias co='sudo netctl stop-all && sudo netctl start'
alias disca='sudo netctl stop-all'

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
alias yd='youtube-dl -f bestvideo[ext=mp4]+bestaudio[ext=m4a] --output "%(title)s.%(ext)s"'
alias ydf='youtube-dl -f bestvideo+bestaudio --output "%(title)s.%(ext)s"'
alias ydp='youtube-dl -f -f bestvideo[ext=mp4]+bestaudio[ext=m4a] --output "%(playlist_index)s-%(title)s.%(ext)s"'
alias ym='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --output "%(title)s.%(ext)s"'
alias ymp='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0  --output "%(playlist_index)s-%(title)s.%(ext)s"'

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
if [[ -f "~/.ssh/id_ed25519" ]]; then
    eval `keychain --eval --agents 'ssh' -Q -q id_ed25519`
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

# Save and restore zsh history file to backup.
if [[
    $(wc -l ~/.local/share/zsh/history | awk '{print $1}') -lt 1000 && \
    $(wc -l ~/.local/share/zsh/history_backup | awk '{print $1}') -gt 1000
]]; then
    echo "History file has less than 1000 lines, restoring backup..."
    cp -f ~/.local/share/zsh/history_backup ~/.local/share/zsh/history
else
    cp -f ~/.local/share/zsh/history ~/.local/share/zsh/history_backup
fi

{% if profile == "server" %}
#Aliases
alias poweroff='reboot'
{% else %}
#Aliases
alias km="killall telegram-deskto"
alias kd="killall -9 Discord"
alias susp='i3lock-blur && systemctl suspend'

# Helper
alias noblank='xset s off && xset -dpms && xset s noblank'
alias todo='vim ~/Syncthing/Transfer/todo.md'

# X
alias startx="startx '$XDG_CONFIG_HOME/X11/xinitrc'"

# VPN
alias vpndown='sudo systemctl stop wg-quick@vpn'
alias vpnup='sudo systemctl start wg-quick@vpn'

# Boot windows
alias windowsboot='sudo efibootmgr -n 0000 && reboot'
{% endif %}
