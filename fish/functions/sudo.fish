function sudo
	if test "$argv" = !!
        echo "sudo " $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
