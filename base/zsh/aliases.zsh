# -------------------- Aliases --------------------

#Various
alias dstat='dstat -tdnclmpry'
alias pong='ping -D google.de'
alias spacman='sudo pacman'
alias add='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias mksrcinfo='updpkgsums && makepkg --printsrcinfo > .SRCINFO'
alias watch='watch -c'

# Systemctl
alias sys='sudo systemctl'
alias sysu='systemctl --user'
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

# Vim
alias nvim='nvim -c "Neotree source=filesystem action=show"'
alias svim='sudo nvim -c "Neotree source=filesystem"'

# Netctl
alias co='sudo netctl stop-all && sudo netctl start'
alias disca='sudo netctl stop-all'

# Git
alias gls='git status'
alias glg='git lg'
alias gsh='git switch'
alias gsm='git switch main 2> /dev/null || git switch master'
alias gb='git branch'
alias gc='git commit'
alias gpu='git push origin -u'
alias gpuf='git push origin -u --force-with-lease'
alias git_describe="git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'"

# Rust
alias clippy='cargo clippy --workspace --tests --all-features'

# Tmux
alias z='zellij'
alias zat='zellij attach -c'

#Docker
alias dcu='docker-compose up'

#Pueue
alias p='pueue'
alias pad='pueue add --'
alias pst='pueue status'

# Youtube dl
alias yd='yt-dlp -f bestvideo[ext=mp4]+bestaudio[ext=m4a] --output "%(title)s.%(ext)s"'
alias ydf='yt-dlp -f bestvideo+bestaudio --output "%(title)s.%(ext)s"'
alias ydp='yt-dlp -f -f bestvideo[ext=mp4]+bestaudio[ext=m4a] --output "%(playlist_index)s-%(title)s.%(ext)s"'
alias ym='yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --output "%(title)s.%(ext)s"'
alias ymp='yt-dlp --extract-audio --audio-format mp3 --audio-quality 0  --output "%(playlist_index)s-%(title)s.%(ext)s"'

# Json formatting
alias jsonformat='python -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=4))" <'

# Python
alias venv="poetry shell"

# dool
alias dool="dool --bytes --time --cpu --load --net --mem"

# Trans
alias t="trans de:en"
alias td="trans :de"

# -------------------- Dotfile cleanup aliases --------------------

alias sqlite3='sqlite3 -init $SQLITE_CONFIG'

# Load tmux with custom config location, if it exists.
if [[ -f "$HOME/.config/tmux/tmux.conf" ]]; then
    alias tmux="tmux -f $HOME/.config/tmux/tmux.conf"
fi

# -------------------- Platform dependant aliases --------------------

{% if profile == "server" %}
alias poweroff='reboot'

{% else %}

# Messenger
alias km="killall telegram-desktop"
alias kd="killall -9 DiscordCanary & killall -9 Discord"

# Helper
alias susp='systemctl suspend'
alias noblank='xset s off && xset -dpms && xset s noblank'
alias blank='xset dpms force off'
alias todo='vim ~/Syncthing/Transfer/todo.md'
alias notes='vim ~/Syncthing/Transfer/notes.md'
alias tether='vpndown && iwctl station wlan0 scan && sleep 2 && iwctl station wlan0 connect lolnuke'
alias wlan='iwctl station wlan0 scan && sleep 1 && iwctl station wlan0 connect '
alias arctis='headsetcontrol --sidetone 0 --inactive-time 90'

# X
alias startx="startx '$XDG_CONFIG_HOME/X11/xinitrc'"

# VPN
alias vpndown='sudo ip link set vpn down'
alias vpnup='sudo ip link set vpn up'

# Boot windows
alias windowsboot='sudo efibootmgr -n 0000 && reboot'

{% endif %}
