# -----------------------------------------------------
# Options
# -----------------------------------------------------

# -----------------------------------------------------
# Zsh History Configuration
# -----------------------------------------------------
# File where command history is saved
HISTFILE=~/.zsh_history
# Number of commands to keep in memory and save to history file
HISTSIZE=10000
SAVEHIST=10000
# Append new history lines to the history file instead of overwriting it
setopt appendhistory
# Append each command to the history file incrementally (ideal for multiple shell sessions)
setopt INC_APPEND_HISTORY
# Share command history across all running shell sessions
setopt SHARE_HISTORY


# -----------------------------------------------------
# Auto suggest highlight style
# -----------------------------------------------------
# See https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg 
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'  


# -----------------------------------------------------
# Directory Stack Navigation Options
# -----------------------------------------------------
# Change to a directory just by typing its name
setopt AUTO_CD
# Automatically push directories onto the directory stack when changing directories
setopt AUTO_PUSHD
# Avoid duplicate entries in the directory stack
setopt PUSHD_IGNORE_DUPS
# Change to previous directory with 'cd -' and rotate stack with 'cd -N'
setopt PUSHD_MINUS
