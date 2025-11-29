# -----------------------------------------------------
# FZF - Fuzzy Finding Customizations
# -----------------------------------------------------

if command -v fzf >/dev/null 2>&1; then
	# FZF keybindings & completion
	source <(fzf --zsh) 2>/dev/null || true

	# Kitty image-clear escape
	export KITTY_CLEAR_IMG=$'\x1b_Ga=d,d=A\x1b\\'

	# Clear kitty icat preview after Ctrl-T fzf exits
	clear_preview_after_fzf() {
		printf "%b" "$KITTY_CLEAR_IMG" > /dev/tty
	}

	# Wrap Ctrl-T behaviour: run normal fzf-file-widget, then clear image
	if zle -l | grep -q '^fzf-file-widget$'; then
		fzf-file-widget-with-clear() {
			zle fzf-file-widget				# call the original widget
			clear_preview_after_fzf			# then clear the image
			zle reset-prompt				# redraw prompt cleanly
		}

		zle -N fzf-file-widget-with-clear
		bindkey '^T' fzf-file-widget-with-clear
	fi

	# Smart Preview (Images, PDF, Videos, Text)
	export PREVIEW_CMD='
		# Clear previous image first
        printf "%b" "$KITTY_CLEAR_IMG"

		if [[ -d {} ]]; then
			eza --tree --color=always {} | head -200;
		else
			mime=$(file --mime-type -Lb {})
			case "$mime" in
				video/*)
					ffprobe -hide_banner {} 2>&1 | head -50
					;;
				image/*)
					kitty icat --clear \
						--transfer-mode=memory \
						--stdin=no \
						--place=${FZF_PREVIEW_COLUMNS:-80}x${FZF_PREVIEW_LINES:-40}@0x0 \
						--scale-up {}
					;;
				application/pdf)
					pdftotext {} - | sed -n "1,200p"
					;;
				*)
					bat -n --color=always --line-range :500 {}
					;;
			esac
		fi
	'

	# -------------------------------------------------
    # GLOBAL FZF SETTINGS
    # -------------------------------------------------
	export FZF_DEFAULT_OPTS="
		--height=80%
		--border
		--ansi
	"

	# fd as the default source
	export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
	export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
	export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

	export FZF_CTRL_T_OPTS="--preview '$PREVIEW_CMD'"
	export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

	# completions using fd
	_fzf_compgen_path() {
		fd --hidden --exclude .git . "$1"
	}

	# Use fd to generate the list for directory completion
	_fzf_compgen_dir() {
		fd --type=d --hidden --exclude .git . "$1"
	}

	# command-aware preview
	_fzf_comprun() {
		local command=$1
		shift

		case "$command" in
			cd)
				fzf --preview 'eza --tree --color=always {} | head -200' "$@"
				;;
			export|unset)
				fzf --preview "eval 'echo \${}'" "$@"
				;;
			ssh)
				fzf --preview 'dig {}' "$@"
				;;
			*)
				fzf --preview "$PREVIEW_CMD" "$@"
				;;
		esac
	}
fi
