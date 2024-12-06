# Open a file picker.
# Picked files are appended to the current prompt buffer.
function filelist
    set --local files $(fd --type f .)
    set --local selection $(echo "$(string join \n $files)" | fzf -m \
        --preview 'bat --color=always {}' \
        --preview-window up:60%  \
        --bind=ctrl-n:preview-down,ctrl-p:preview-up,q:abort,tab:toggle,ctrl-i:toggle,ctrl-o:toggle-preview)

    commandline --append "$selection"
    set --local ret $status
    return $ret
end
