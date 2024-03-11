# -------------------- External plugin init --------------------
if [[ -f "/usr/share/fzf/key-bindings.zsh" ]]; then
    source "/usr/share/fzf/key-bindings.zsh"
fi

if [[ -d "$HOME/repos/tools/pueue/utils/completions/" ]]; then
    fpath=($HOME/repos/tools/pueue/utils/completions/ $fpath)
fi

autoload -U compinit && compinit -d $HOME/.cache/zsh/zcompdump

# -------------------- Plugins/External --------------------

export SHELDON_CONFIG_DIR="$HOME/.config/sheldon"
export SHELDON_DATA_DIR="$HOME/.local/share/sheldon"
# Plugin manager
eval "$(sheldon -q source)"
# Prompt
eval "$(starship init zsh)"
# Shared history
eval "$(atuin init zsh --disable-up-arrow)"

# -------------------- General configuration --------------------
autoload -U promptinit && promptinit

#Syntax Highlighting
ZSH_HIGHLIGHT_STYLES[globbing]='fg=002,bold'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=002,bold'

# zoxide init + j alias for convenience
eval "$(zoxide init zsh --cmd j)"

# Aliases
if [ -f "$HOME/.config/zsh/aliases.zsh" ]; then
    source $HOME/.config/zsh/aliases.zsh
fi

# -------------------- UI Keybind functions--------------------
# Stage files multi-selected modified files
__gflist() {
    local files=$(git ls-files -m -o -d --exclude-standard | uniq)
    local selection=( $($(__fzfcmd) -m \
        --preview 'git-diff-all {}' \
        --preview-window up:60%  \
        --bind=ctrl-n:preview-down,ctrl-p:preview-up,q:abort,tab:toggle,ctrl-i:toggle,ctrl-o:toggle-preview <<< $files) )

    LBUFFER="${LBUFFER} ${selection}"
    local ret=$?
    return $ret
}

# Select a git branch
__gblist() {
    local branches=$(git branch --format='%(refname:short)')
    local selection=( $($(__fzfcmd) -m \
        --preview 'git diff --color=always {}' \
        --preview-window up:60%  \
        --bind=ctrl-n:preview-down,ctrl-p:preview-up,q:abort,tab:toggle,ctrl-i:toggle,ctrl-o:toggle-preview <<< $branches) )

    LBUFFER="${LBUFFER} ${selection}"
    local ret=$?
    return $ret
}


# -------------------- Key bindings --------------------
# Bind the file selection to CTRL-g
zle -N __gflist
bindkey "^g" __gflist

# Bind the branch selection to CTRL-b
zle -N __gblist
bindkey "^b" __gblist

# -------------------- CLI functions --------------------

sshHcloud() {
    hcloud server ssh $1 -o StrictHostKeyChecking=no -i $2 "${@:3}"
}

block_and_wait() {
    if [ "$#" -eq 0  ]; then
        echo "First parameter should be the name of the semaphore."
        return 1;
    fi
    mkdir -p "$XDG_RUNTIME_DIR/semaphores"

    if [[ -f "$XDG_RUNTIME_DIR/semaphores/$1" ]]; then
        echo "Semaphore $1 already exists."
    else
        echo "Creating semaphore $1"
        touch "$XDG_RUNTIME_DIR/semaphores/$1"
    fi

    # Wait until the semaphore has been removed
    while true; do
        if [[ ! -f "$XDG_RUNTIME_DIR/semaphores/$1" ]]; then
            return 0;
        fi
        sleep 2
    done
}

unblock() {
    if [ "$#" -eq 0 ]; then
        echo "First parameter should be the name of the semaphore."
        return 1;
    fi

    if [[ -f "$XDG_RUNTIME_DIR/semaphores/$1" ]]; then
        echo "Removing semaphore $1"
        rm "$XDG_RUNTIME_DIR/semaphores/$1"
    else
        echo "Couldn't find semaphore at $XDG_RUNTIME_DIR/semaphores/$1"
        return 1;
    fi
}


# -------------------- Other stuff --------------------
export TERM='xterm-256color'

# Only store the last 1000 history entries, as we're using atuin
HISTSIZE=1000
setopt inc_append_history   # write to history immediately
setopt hist_ignore_dups     # ignore second instance of same event
setopt share_history        # share history between session
setopt extended_history     # special history format with timestamp
setopt no_hist_beep         # fucking beep
setopt hist_ignore_space    # ignore entries with leading space
