.PHONY: ncmpcpp config

basic:
	./init_directories.sh
	stow -t ~/.config -R shared-config

client: basic
	stow -t ~/.config -R client-config
	stow -t ~/ -R client-home

work: basic client
	stow -t ~/.config -R work-config

server: basic
	stow -t ~/.config -R server-config
	stow -t ~/ -R server-home
