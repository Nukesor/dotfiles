# Path setup
path=($HOME/.bin $path)
path=($HOME/.cache/cargo/bin $path)
path=($path ./bin)
path=($path $HOME/.screenlayout)
path=($path ./node_modules/.bin)

# XDG Setup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Config cleanup
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export WEECHAT_HOME=$XDG_CONFIG_HOME/weechat
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export MPLAYER_HOME=$XDG_CONFIG_HOME/mplayer
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export TASKRC=$XDG_CONFIG_HOME/task/taskrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# Cache cleanup
export LESSHISTFILE=-
export _FASD_DATA=$XDG_CACHE_HOME/fasd/fasd_history
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export SQLITE_HISTORY=$XDG_CACHE_HOME/sqlite_history
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

export ZSH_COMPDUMP=$XDG_CACHE_HOME/zsh/zcompdump
export CARGO_HOME=$XDG_CACHE_HOME/cargo
export CCACHE_DIR=$XDG_CACHE_HOME/ccache

# Data cleanup
export HISTFILE=$XDG_DATA_HOME/zsh/history
export VAGRANT_HOME=$XDG_DATA_HOME/vagrant
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/password-store
export WINEPREFIX=$XDG_DATA_HOME/wine

# Work/Android dev Stuff
export ADB_LIBUSB=1
export ANDROID_SDK_ROOT="$XDG_DATA_HOME/android-sdk"
path=($path $ANDROID_SDK_ROOT/cmdline-tools/latest/bin)
path=($path $ANDROID_SDK_ROOT/platform-tools)
path=($path $ANDROID_SDK_ROOT/tools)
export PUB_CACHE="$XDG_CACHE_HOME/dart-pub-cache"
export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"

# Runtime cleanup
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"

# Vim setup
export EDITOR=nvim
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Styling
export GTK_THEME=Advaita:dark

# Convenience stuff
export ZRC=$ZDOTDIR/.zshrc
export NVIM=$XDG_CONFIG_HOME/nvim/

# Application logic
export VAGRANT_EXPERIMENTAL="disks"
export JAVA_HOME=/usr/lib/jvm/default
