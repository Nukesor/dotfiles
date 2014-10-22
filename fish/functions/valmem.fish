function valmem
	command valgrind --tool=memcheck $argv
end
