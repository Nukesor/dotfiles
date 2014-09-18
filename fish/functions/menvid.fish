function menvid
	set bitrate 20000
    echo -e "Using bitrate of $bitrate \n"
    mencoder *.png -mf w=1920:h=1080:fps=20:type=png -ovc x264 -x264encopts threads=auto:pass=1:bitrate=$bitrate:slow_firstpass -oac copy -o $argv
    mencoder *.png -mf w=1920:h=1080:fps=20:type=png -ovc x264 -x264encopts threads=auto:pass=2:bitrate=$bitrate -oac lavc -lavcopts acodec=vorbis -o "$argv"
end
