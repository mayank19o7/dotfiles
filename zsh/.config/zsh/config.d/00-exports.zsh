# -----------------------------------------------------
# Exports
# -----------------------------------------------------

# Path to Oh-My-Zsh installation directory
export ZSH="$HOME/.oh-my-zsh"

# HISTCONTROL: Ignore commands that start with spaces and duplicate commands
export HISTCONTROL=ignoreboth

# HISTIGNORE: Don't add these commands to the history file to avoid clutter
export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# LESS pager options for better readability and color support
export LESS="--RAW-CONTROL-CHARS"
export LESS_TERMCAP_mb=$'\e[1;31m'		# Start blinking text
export LESS_TERMCAP_md=$'\e[1;34m'		# Start bold mode
export LESS_TERMCAP_me=$'\e[0m'			# End all modes
export LESS_TERMCAP_so=$'\e[38;5;215m'	# Start standout mode (yellowish highlight)
export LESS_TERMCAP_se=$'\e[0m'			# End standout mode
export LESS_TERMCAP_us=$'\e[4;35m'		# Start underline mode
export LESS_TERMCAP_ue=$'\e[0m'			# End underline mode

# Locale.
export LANG="en_US.UTF-8"


# -----------------------------------------------------
# Initialize Oh-My-Zsh framework
# -----------------------------------------------------
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

source $ZSH/oh-my-zsh.sh


# -----------------------------------------------------
# FZF key bindings: CTRL-R for fuzzy history search
# -----------------------------------------------------
source <(fzf --zsh)


# -----------------------------------------------------
# Node version manager
# -----------------------------------------------------
source /usr/share/nvm/init-nvm.sh


# -----------------------------------------------------
# Powerlevel 10K
# -----------------------------------------------------
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
