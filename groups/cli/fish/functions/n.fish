# Open my notes
function n
    set --function note 'notes'
    if test (count $argv) -ge 1
        set --function note $argv[1]
    end

    # Set an .md extension if there's not already one.
    if not path extension $note;
        set --function note "$note.md"
    end

    vim ~/Dokumente/Various/notes/$note
end

complete -f --command n --arguments '(fd . --base-directory=/home/nuke/Dokumente/Various/notes -t file)'
