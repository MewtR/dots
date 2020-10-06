#Uncomment next if block to start Gnome on Wayland (Still requires X11 for applications that don't support Wayland yet)

#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ -z $XDG_SESSION_TYPE ]]; then
#	XDG_SESSION_TYPE=wayland exec  gnome-session
#	#XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
#fi


#Next if block is for X11

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec startx
fi
