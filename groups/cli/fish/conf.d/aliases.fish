# -------------------- Aliases --------------------

#Various
alias dstat='dstat -tdnclmpry'
alias pong='ping -D google.de'
alias ppong='prettyping google.de'
alias spacman='sudo pacman'
alias add='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias mksrcinfo='updpkgsums && makepkg --printsrcinfo > .SRCINFO'
alias watch='watch -c'
alias dfc='dfc -t btrfs,vfat,ext4'

# Systemctl
alias systatus='systemctl --type=service --all'

# Rsync
alias arsync='rsync -a --partial --progress'

# Ls
alias ls='ls --color=auto'
alias lh='ls -lh'
alias la='ls -alh'

# cp
alias cp='cp --reflink=auto'

# Vim
alias nvim='nvim -c "Neotree source=filesystem action=show"'
alias svim='sudo nvim -c "Neotree source=filesystem"'
alias todo='n todo'
alias notes='n notes'

# Git
alias gls='git status'
alias glg='git lg'
alias gsh='git switch'
alias gsm='git switch main &> /dev/null || git switch master'
alias gb='git branch'
alias gpu='git push --set-upstream origin'
alias gpuf='git push --set-upstream origin --force-with-lease'
alias git_describe="git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'"

# Rust
alias clippy='cargo clippy --workspace --tests --all-features'

# Tmux
alias tew='tmux new -s'
alias tat='tmux attach -t'
alias z='zellij'
alias zat='zellij attach -c'

# Docker
alias dcu='docker-compose up'

# Pueue
alias p='pueue'

# Youtube dl
alias yd='yt-dlp -f bestvideo[ext=mp4]+bestaudio[ext=m4a] --output "%(title)s.%(ext)s"'
alias ydf='yt-dlp -f bestvideo+bestaudio --output "%(title)s.%(ext)s"'
alias ydp='yt-dlp -f -f bestvideo[ext=mp4]+bestaudio[ext=m4a] --output "%(playlist_index)s-%(title)s.%(ext)s"'
alias ym='yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --output "%(title)s.%(ext)s"'
alias ymp='yt-dlp --extract-audio --audio-format mp3 --audio-quality 0  --output "%(playlist_index)s-%(title)s.%(ext)s"'

# Json formatting
alias jsonformat='python -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=4))" -'

# Python
alias venv="source .venv/bin/activate.fish"

# dool
alias dool="dool --bytes --time --cpu --load --net --mem --disk"

# Trans
alias t="trans de:en"
alias td="trans :de"

# -------------------- Dotfile cleanup aliases --------------------

alias sqlite3='sqlite3 -init $SQLITE_CONFIG'

# Load tmux with custom config location, if it exists.
alias tmux="tmux -f $HOME/.config/tmux/tmux.conf"

# -------------------- Platform dependant aliases --------------------

# Messenger
alias km="killall telegram-desktop"
alias kd="killall -9 DiscordCanary & killall -9 Discord"

# Helper
alias susp='systemctl suspend'
alias noblank='xset s off && xset -dpms && xset s noblank'
alias blank='xset dpms force off'
alias tether='vpndown && iwctl station wlan0 scan && sleep 2 && iwctl station wlan0 connect lolnuke'
alias wlan='iwctl station wlan0 scan && sleep 1 && iwctl station wlan0 connect '
alias arctis='headsetcontrol --sidetone 0 --inactive-time 90'

# X
alias startx="startx '$XDG_CONFIG_HOME/X11/xinitrc'"

# VPN
alias vpndown='sudo ip link set vpn down'
alias vpnup='sudo ip link set vpn up'
alias vpnpause='sudo ip link set vpn down && nohup bash -c "sleep 120 && sudo ip link set vpn up" >/dev/null 2>&1 & disown'

# Boot windows
alias windowsboot='sudo efibootmgr -n 0000 && reboot'
