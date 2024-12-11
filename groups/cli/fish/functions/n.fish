# Open my notes
function n
    set --function note_path 'notes'
    if test (count $argv) -ge 1
        set --function note_path $argv[1]
    end
    echo $note_path

    vim ~/Dokumente/Various/notes/$note_path.md
end
