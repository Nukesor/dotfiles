# Open a git staging file picker.
# Picked files are appended to the current prompt buffer.
function git_file_list
    set --local files $(git ls-files -m -o -d --exclude-standard | uniq)
    set --local selection $(echo "$(string join \n $files)" | fzf -m \
        --preview 'git-diff-all {}' \
        --preview-window up:60%  \
        --bind=ctrl-n:preview-down,ctrl-p:preview-up,q:abort,tab:toggle,ctrl-i:toggle,ctrl-o:toggle-preview)

    commandline --append " $selection"
    set --local ret $status
    return $ret
end
