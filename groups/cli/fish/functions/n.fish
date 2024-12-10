# Open my notes
function n
    set --local note_path 'notes'
    if [ $(count $argv) != 0 ]
        set --local note_path $1
    end
    cd ~/Dokumente/Various/notes/ && vim ~/Dokumente/Various/notes/$note_path.md || true
    cd "$OLDPWD"
end
