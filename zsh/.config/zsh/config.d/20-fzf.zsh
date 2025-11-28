# -----------------------------------------------------
# FZF - Fuzzy Finding Customizations
# -----------------------------------------------------

if command -v fzf >/dev/null 2>&1; then
	# FZF keybindings & completion
	source <(fzf --zsh) 2>/dev/null || true

	# Kitty image-clear escape
	export KITTY_CLEAR_IMG=$'\x1b_Ga=d,d=A\x1b\\'

	# Smart Preview (Images, PDF, Videos, Text)
	export PREVIEW_CMD='
		# Clear previous image first
        printf "$KITTY_CLEAR_IMG"

		if [[ -d {} ]]; then
			eza --tree --color=always {} | head -200;
		else
			bat -n --color=always --line-range :500 {};
		fi
	'

	# -------------------------------------------------
    # GLOBAL FZF SETTINGS
    # -------------------------------------------------
	export FZF_DEFAULT_OPTS="
	--layout=reverse
	--height=80%
	--border
	--ansi
	--bind 'f2:toggle-preview'
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

	# Custom fzf completion preview depending on command
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
