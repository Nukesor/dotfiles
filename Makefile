.PHONY: ncmpcpp config

basic:
	./init_directories.sh
	stow -t ~/.config -R shared-config
	stow -t ~/ -R shared-home

client: basic
	stow -t ~/.config -R client-config

work: basic client
	stow -t ~/.config -R work-config

server: basic
	stow -t ~/.config -R server-config

