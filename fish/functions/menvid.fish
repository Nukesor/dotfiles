function menvid
	set BITRATE 20000
    echo -e "Using bitrate of $BITRATE \n"
    mencoder mf://*.png -mf w=1920:h=1080:fps=33:type=png -ovc x264 -x264encopts threads=auto:pass=1:bitrate=$bitrate:slow_firstpass -oac copy -o $argv
end
