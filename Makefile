.PHONY: ncmpcpp config

basic:
	./init_directories.sh
	stow -t ~/.config -R config
	stow -t ~/ -R home

client: basic
	stow -t ~/.config/zsh -R client

work: basic client
	stow -t ~/.config/zsh -R work

server: basic
	stow -t ~/.config/zsh -R server

