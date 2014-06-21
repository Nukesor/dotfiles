function backupconf
	cp ~/.Xresources ~/Dokumente/stuff/
    cp ~/.xinitrc ~/Dokumente/stuff/
    # I3
    cp -r ~/.i3 ~/Dokumente/stuff/
    cp ~/.i3status.conf ~/Dokumente/stuff/
    # Shell
    cp ~/.bashrc ~/Dokumente/stuff/
    cp -r ~/.config/fish ~/Dokumente/stuff/
    # Vim
    cp ~/.vimrc ~/Dokumente/stuff/
    cp ~/.ycm_extra_conf.py ~/Dokumente/stuff/
    # Conky
    cp ~/.conkyrc ~/Dokumente/stuff/
    # Makepkg
    cp ~/.makepkg.conf ~/Dokumente/stuff/
    # Mpd and ncmpcpp
    cp -r ~/.config/mpd/playlists ~/Dokumente/stuff/mpd/
    cp ~/.config/mpd/mpd.conf ~/Dokumente/stuff/mpd/
    cp ~/.ncmpcpp/config ~/Dokumente/stuff/.ncmpcpp/config
    # Cataclysm
    cp ~/.cataclysm/.start.sh ~/Dokumente/stuff/mpd/.start.sh
    cp ~/.cataclysm/.backup.sh ~/Dokumente/stuff/mpd/.backup.sh
    cp ~/.cataclysm/.restore.sh ~/Dokumente/stuff/mpd/.restore.sh
end
