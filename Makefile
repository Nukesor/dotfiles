.PHONY: ncmpcpp config

basic:
	mkdir -p ~/.config
	mkdir -p ~/.config/mpd
	stow -t ~/.config -R config
	stow -t ~/ -R editorconf
	stow -t ~/ -R git
	stow -t ~/ -R playlists
	stow -t ~/ -R scripts
	stow -t ~/ -R various
	stow -t ~/ -R nvim
	stow -t ~/ -R zsh

client: basic
	stow -t ~/ -R i3
	stow -t ~/ -R termite
	stow -t ~/ -R mpv
	stow -t ~/ -R mpd
	stow -t ~/ -R ncmpcpp
	stow -t ~/ -R x
	stow -t ~/ -R zsh-client

work: basic client
	stow -t ~/ -R zsh-work

server: basic
	stow -t ~/ -R zsh-server

