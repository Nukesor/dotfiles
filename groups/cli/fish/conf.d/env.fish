# Path setup
fish_add_path -p $HOME/.bin \
    $HOME/.cache/cargo/bin \
    $HOME/work/bin \
    $HOME/repos/accounting/bin

# XDG Setup
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"

# Application logic
set -gx EDITOR nvim
set -gx MANPAGER "bat -l man -p"
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
set -gx JAVA_HOME /usr/lib/jvm/default
set -gx PYTHON_KEYRING_BACKEND keyring.backends.null.Keyring

# DevOps Stuff
set -gx AZURE_CONFIG_DIR $XDG_DATA_HOME/azure
set -gx VAGRANT_EXPERIMENTAL "disks"
set -gx DOCKER_HOST "unix://$XDG_RUNTIME_DIR/podman/podman.sock"

# History files
set -gx _FASD_DATA $XDG_DATA_HOME/fasd/fasd_history
set -gx LESSHISTFILE "$XDG_DATA_HOME/less_history"
set -gx PSQL_HISTORY "$XDG_DATA_HOME/psql_history"
set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history

# Config cleanup
set -gx DOCKER_CONFIG "$XDG_CONFIG_HOME"/docker
set -gx _JAVA_OPTIONS -Djava.util.prefs.userRoot "$XDG_CONFIG_HOME"/java
set -gx MPLAYER_HOME $XDG_CONFIG_HOME/mplayer
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx SQLITE_CONFIG "$XDG_CONFIG_HOME"/sqlite/sqliterc
set -gx TEXMFCONFIG $XDG_CONFIG_HOME/texlive/texmf-config
set -gx WEECHAT_HOME $XDG_CONFIG_HOME/weechat
set -gx XINITRC $XDG_CONFIG_HOME/X11/xinitrc
set -gx AZURE_CONFIG_DIR $XDG_CONFIG_HOME/azure

# Cache cleanup
set -gx CARGO_HOME $XDG_CACHE_HOME/cargo
set -gx CCACHE_DIR $XDG_CACHE_HOME/ccache
set -gx CUDA_CACHE_PATH "$XDG_CACHE_HOME"/nv
set -gx ERRFILE "$XDG_CACHE_HOME/X11/xsession-errors"
set -gx TEXMFVAR $XDG_CACHE_HOME/texlive/texmf-var
set -gx XARGO_HOME $XDG_CACHE_HOME/cargo
set -gx ANSIBLE_HOME "$XDG_CACHE_HOME/ansible"

# Data cleanup
set -gx GOPATH $XDG_DATA_HOME/go
set -gx DISCORD_USER_DATA_DIR $XDG_DATA_HOME/discord
set -gx PASSWORD_STORE_DIR $XDG_DATA_HOME/password-store
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx VAGRANT_HOME $XDG_DATA_HOME/vagrant
set -gx VSCODE_EXTENSIONS $XDG_DATA_HOME/vscode
set -gx WINEPREFIX $XDG_DATA_HOME/wine

# Runtime cleanup
set -gx TMUX_TMPDIR "$XDG_RUNTIME_DIR"
