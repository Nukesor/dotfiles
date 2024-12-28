# Open a git branch picker.
# Picked branches are appended to the current prompt buffer.
function git_branch_list
    set --local branches $(git branch --format='%(refname:short)')
    set --local selection $(echo "$(string join \n $branches)" | fzf -m \
        --preview 'git diff --color=always {}' \
        --preview-window up:60%  \
        --bind=ctrl-n:preview-down,ctrl-p:preview-up,q:abort,tab:toggle,ctrl-i:toggle,ctrl-o:toggle-preview
    )

    # If there's already something on the buffer, simply append the branches to the buffer
    # instead of switching to them. Useful for command completion for branches.
    if not test -z (commandline --current-buffer)
        commandline --append "$selection"
        commandline -f end-of-line
        commandline -f repaint
        return 0
    end

    git switch $selection
    set --local ret $status

    # Without this, no prompt will be visible.
    commandline -f repaint
    return $ret
end
