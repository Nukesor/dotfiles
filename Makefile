.PHONY: ncmpcpp config

basic:
	mkdir -p ~/.config
	mkdir -p ~/.config/mpd
	stow -t ~/.config -R config
	stow -t ~/ -R home

client: basic
	stow -t ~/ -R zsh-client

work: basic client
	stow -t ~/ -R zsh-work

server: basic
	stow -t ~/ -R zsh-server

