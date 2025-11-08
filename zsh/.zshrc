#
#                                                      - mayank19o7
#
# oooooo        8                .oPYo.               d'b  o
#     d'        8                8    8               8
#    d'  .oPYo. 8oPYo.           8      .oPYo. odYo. o8P  o8 .oPYo.
#   d'   Yb..   8    8   ooooo   8      8    8 8' `8  8    8 8    8
#  d'      'Yb. 8    8           8    8 8    8 8   8  8    8 8    8
# dooooo `YooP' 8    8           `YooP' `YooP' 8   8  8    8 `YooP8
# .......:.....:..:::..:::::::::::.....::.....:..::..:..:::..:....8
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::ooP'.
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::...::
# ------------------------------------------------------------------

# -------------------------------------------------------
# Oh-My-Zsh plugins
# -------------------------------------------------------
# Only set plugins if not already set (to avoid overwrite)
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
[[ -z "${plugins[*]}" ]] && plugins=(
	git
	fzf
	extract
	ssh-agent
	zsh-autosuggestions
	zsh-syntax-highlighting
	fast-syntax-highlighting
	zsh-history-substring-search
)


# -------------------------------------------------------
# Load custom modular configs from ~/.config/zsh/config.d
# -------------------------------------------------------
for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
	source "${conf}"
done
