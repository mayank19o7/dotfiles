# -----------------------------------------------------
# Exports
# -----------------------------------------------------

# Path to Oh-My-Zsh installation directory
export ZSH="/usr/share/oh-my-zsh"

# HISTCONTROL: Ignore commands that start with spaces and duplicate commands 
export HISTCONTROL=ignoreboth

# HISTIGNORE: Don't add these commands to the history file to avoid clutter
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

# Default text editor
export EDITOR=micro

# LESS pager options for better readability and color support
export LESS="--RAW-CONTROL-CHARS"
export LESS_TERMCAP_mb=$'\e[1;31m'  # Start blinking text
export LESS_TERMCAP_md=$'\e[1;34m'  # Start bold mode
export LESS_TERMCAP_me=$'\e[0m'     # End all modes
export LESS_TERMCAP_so=$'\e[38;5;215m'  # Start standout mode (yellowish highlight)
export LESS_TERMCAP_se=$'\e[0m'         # End standout mode
export LESS_TERMCAP_us=$'\e[4;35m'   # Start underline mode
export LESS_TERMCAP_ue=$'\e[0m'      # End underline mode

# Locale.
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# -------------------------------------------------------
# Initialize Oh-My-Zsh framework
# -------------------------------------------------------
source $ZSH/oh-my-zsh.sh
