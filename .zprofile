[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec ssh-agent startx -ardelay 200 -arinterval 20 ]]
