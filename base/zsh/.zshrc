# -------------------- External plugin init --------------------
if [[ -f "/usr/share/fzf/key-bindings.zsh" ]]; then
    source "/usr/share/fzf/key-bindings.zsh"
fi
if [[ -f "/usr/share/fzf/completion.zsh" ]]; then
    source "/usr/share/fzf/completion.zsh"
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

# -------------------- Custom functions--------------------
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

# -------------------- Other stuff --------------------
export TERM='xterm-256color'

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
    if [[ -f "$HOME/.local/share/zsh/history" ]]; then
        cp -f ~/.local/share/zsh/history ~/.local/share/zsh/history_backup
    fi
fi

sshHcloud() {
    hcloud server ssh $1 -o StrictHostKeyChecking=no -i ~/.ssh/work/hcloud_sshkey "${@:2}"
}
