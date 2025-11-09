# Auto-start Hyprland only on the first TTY if installed (avoids launching in nested or remote sessions)
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ] && command -v start-hyprland >/dev/null 2>&1; then
	exec start-hyprland
fi
