# -----------------------------------------------------
# AutoStart
# -----------------------------------------------------


# -----------------------------------------------------
# Run fastfetch safely in interactive shells
# -----------------------------------------------------
if [[ $(tty 2>/dev/null) == *"pts"* ]]; then
	# ~/.config/fastfetch/presets should have a terminal.jsonrc to be used/auto-started in zsh.
	if command -v fastfetch >/dev/null 2>&1; then
		if fastfetch --config "$HOME/.config/fastfetch/presets/terminal" 2>/dev/null; then
			echo
			echo "Press any key to clear..."
			read -k 1 -s
			clear
		fi
	fi
fi
