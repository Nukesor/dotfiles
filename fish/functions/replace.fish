function replace
	set sedcommand 's/'$argv[1]'/'$argv[2]'/g'
    set places (grep -rl $argv[1])
    command echo 'Replacing '$argv[1]' by '$argv[2] 'in the following Files: '
    command echo $places
    command sed -i $sedcommand $places
end
