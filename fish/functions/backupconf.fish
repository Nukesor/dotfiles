function backupconf
	
    rm -rf ~/Dokumente/stuff/mpd
    rm -rf ~/Dokumente/stuff/fish
    rm ~/Dokumente/stuff/.gitconfig
    rm ~/Dokumente/stuff/.Xresources
    rm ~/Dokumente/stuff/.xinitrc
    rm ~/Dokumente/stuff/.dir_colors
    rm -r ~/Dokumente/stuff/.i3
    rm ~/Dokumente/stuff/.i3status.conf
    rm ~/Dokumente/stuff/.bashrc
    rm ~/Dokumente/stuff/.vimrc
    rm ~/Dokumente/stuff/.ycm_extra_conf.py
    rm ~/Dokumente/stuff/.conkyrc
    rm ~/Dokumente/stuff/.makepkg.conf
    rm -r ~/Dokumente/stuff/.ncmpcpp
    rm -r ~/Dokumente/stuff/.cataclysm

    # Dir creation
    mkdir -p ~/Dokumente/stuff/mpd
    mkdir -p ~/Dokumente/stuff/.ncmpcpp
    mkdir -p ~/Dokumente/stuff/.cataclysm

    # Copying updated configs
    ## Gitconfig
	cp ~/.gitconfig ~/Dokumente/stuff/
    ## X, xterm
	cp ~/.Xresources ~/Dokumente/stuff/
    cp ~/.xinitrc ~/Dokumente/stuff/
    cp ~/.dir_colors ~/Dokumente/stuff/
    ## I3
    cp -r ~/.i3 ~/Dokumente/stuff/
    cp ~/.i3status.conf ~/Dokumente/stuff/
    ## Shell
    cp ~/.bashrc ~/Dokumente/stuff/
    cp -r ~/.config/fish ~/Dokumente/stuff/
    ## Vim
    cp ~/.vimrc ~/Dokumente/stuff/
    cp ~/.ycm_extra_conf.py ~/Dokumente/stuff/
    ## Conky
    cp ~/.conkyrc ~/Dokumente/stuff/
    ## Makepkg
    cp ~/.makepkg.conf ~/Dokumente/stuff/
    ## Mpd and ncmpcpp
    cp ~/.config/mpd/mpd.conf ~/Dokumente/stuff/mpd/
    cp -r ~/.config/mpd/playlists ~/Dokumente/stuff/mpd/
    cp ~/.ncmpcpp/config ~/Dokumente/stuff/.ncmpcpp/
    cp ~/.ncmpcpp/bindings ~/Dokumente/stuff/.ncmpcpp/
    ## Cataclysm
    cp ~/.cataclysm/.start.sh ~/Dokumente/stuff/.cataclysm/.start.sh
    cp ~/.cataclysm/.backup.sh ~/Dokumente/stuff/.cataclysm/.backup.sh
    cp ~/.cataclysm/.restore.sh ~/Dokumente/stuff/.cataclysm/.restore.sh
end
