# Open a directory picker.
# - If the current prompt buffer is empty, immediately cd into the selected directory.
# - If the buffer is not empty, appended the picked directories to the current prompt buffer.
function dirlist
    # Get a directory, cd into it and save the exit code for later
    set --local target $(zoxide query --exclude $(__zoxide_pwd) --interactive)
    # Return early if the zoxide call is aborted.
    # Otherwise $target is empty and we would jump to the home directory.
    if test -z $target
        commandline -f repaint
        return
    end

    # If there's already something on the buffer, simply append the directory to the buffer
    # instead of entering the directory. Useful for command completion of well-used dirs.
    if not test -z (commandline --current-buffer)
        commandline --append " $selection"
        return 0
    end

    cd $target
    set --local ret $status

    # Without this, no prompt will be visible.
    commandline -f repaint
    return $ret
end
