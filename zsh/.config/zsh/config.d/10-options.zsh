# -----------------------------------------------------
# Options
# -----------------------------------------------------


# -----------------------------------------------------
# Better history
# -----------------------------------------------------
# appendhistory -- Append new history lines to the history file instead of overwriting it
# inc_append_history -- Append each command to the history file incrementally (ideal for multiple shell sessions)
# share_history -- and share command history across all running shell sessions
setopt appendhistory inc_append_history share_history


# -----------------------------------------------------
# Directory Stack Navigation Options
# -----------------------------------------------------
# auto_cd -- Change to a directory just by typing its name
# auto_pushd -- Automatically push directories onto the directory stack when changing directories
# pushd_ignore_dups -- duplicate entries in the directory stack
# pushd_minus -- Change to previous directory with 'cd -' and rotate stack with 'cd -N'
setopt auto_cd auto_pushd pushd_ignore_dups pushd_minus


# -----------------------------------------------------
# Zsh History Configuration
# -----------------------------------------------------
# File where command history is saved
HISTFILE=~/.zsh_history
# Number of commands to keep in memory and save to history file
HISTSIZE=10000
SAVEHIST=10000


# -----------------------------------------------------
# Auto suggest highlight style
# -----------------------------------------------------
# See https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

