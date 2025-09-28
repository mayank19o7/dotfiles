# -----------------------------------------------------
# AutoStart
# -----------------------------------------------------

# -----------------------------------------------------
# Fastfetch: show system info on pseudo terminals (remote or VM)
# -----------------------------------------------------
if [[ $(tty 2>/dev/null) == *"pts"* ]]; then
	# ~/.config/fastfetch/presets should have a terminal.jsonrc to be used/auto-started in zsh.
	if command -v fastfetch >/dev/null 2>&1; then
		fastfetch --config "$HOME/.config/fastfetch/presets/terminal" 2>/dev/null || true
	fi
fi
