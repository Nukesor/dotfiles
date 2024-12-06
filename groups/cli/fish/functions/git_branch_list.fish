# Open a git branch picker.
# Picked branches are appended to the current prompt buffer.
function git_branch_list
    set --local branches $(git branch --format='%(refname:short)')
    set --local selection $(echo "$(string join \n $branches)" | fzf -m \
        --preview 'git diff --color=always {}' \
        --preview-window up:60%  \
        --bind=ctrl-n:preview-down,ctrl-p:preview-up,q:abort,tab:toggle,ctrl-i:toggle,ctrl-o:toggle-preview
    )

    commandline --append " $selection"
    set --local ret $status
    return $ret
end
