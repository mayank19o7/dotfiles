# Auto-start Hyprland only on the first TTY (avoids launching in nested or remote sessions)
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	exec start-hyprland
fi
