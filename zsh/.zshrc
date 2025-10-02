#  ______ _____ _    _             _____ ____  _   _ ______ _____ _____
# |___  // ____| |  | |           / ____/ __ \| \ | |  ____|_   _/ ____|
#    / /| (___ | |__| |  ______  | |   | |  | |  \| | |__    | || |  __
#   / /  \___ \|  __  | |______| | |   | |  | | . ` |  __|   | || | |_ |
#  / /__ ____) | |  | |          | |___| |__| | |\  | |     _| || |__| |
# /_____|_____/|_|  |_|           \_____\____/|_| \_|_|    |_____\_____|
# ----------------------------------------------------------------------


# -------------------------------------------------------
# Load CachyOS custom Zsh config (if available)
# Uncomment if you want to source the default CachyOS config first

# source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# -------------------------------------------------------


# -------------------------------------------------------
# Oh-My-Zsh plugin setup
# Only set plugins if not already set (to avoid overwrite)
# -------------------------------------------------------
[[ -z "${plugins[*]}" ]] && plugins=(
    git
    fzf
    extract
)


# -------------------------------------------------------
# Load custom modular configs from ~/.config/zsh/config.d
# -------------------------------------------------------
for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
  source "${conf}"
done


# -------------------------------------------------------
# FZF key bindings: CTRL-R for fuzzy history search
# -------------------------------------------------------
source <(fzf --zsh)


# -----------------------------------------------------
# Fish-like shell experience: syntax highlighting, autosuggestions, substring history search
# -----------------------------------------------------
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh


# -----------------------------------------------------
# Pkgfile command-not-found handler
# -----------------------------------------------------
source /usr/share/doc/pkgfile/command-not-found.zsh
