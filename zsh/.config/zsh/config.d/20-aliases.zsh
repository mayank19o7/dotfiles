# -----------------------------------------------------
# Aliases
# -----------------------------------------------------

# -------------------------------
# Navigation Shortcuts
# -------------------------------
alias ..='cd ..'					# Go up one directory
alias ...='cd ../..'				# Go up two directories
alias .3='cd ../../..'				# Go up three directories
alias .4='cd ../../../..'			# Go up four directories
alias .5='cd ../../../../..'		# Go up five directories
alias ~='cd ~'						# Jump to home directory
alias -- -='cd -'					# Switch to last visited directory
alias 1='cd -'						# Go to last directory (history -1)
alias 2='cd -2'						# Go to directory from 2 steps back
alias 3='cd -3'						# Go to directory from 3 steps back
alias 4='cd -4'						# Go to directory from 4 steps back
alias 5='cd -5'						# Go to directory from 5 steps back
alias path='echo -e ${PATH//:/\\n}'	# Show PATH entries line-by-line


# -------------------------------
# General Commands
# -------------------------------
alias c='clear'							# Clear terminal screen
alias grep='grep --color=auto'			# Colorize grep output for better visibility
alias please='sudo $(fc -ln -1)'		# Rerun last command with sudo


# -------------------------------
# Bookmarks
# -------------------------------
alias conf='cd ~/.config && ls'		# Go to .config, shows list of dir and files
alias dl='cd ~/Downloads && ls'		# Go to Downloads, shows list of dir and files
alias doc='cd ~/Documents && ls'	# Go to Documents, shows list of dir and files
alias dot='cd ~/Dotfiles && ls'		# Go to Dotfiles, shows list of dir and files


# -------------------------------
# File Management
# -------------------------------
alias edit='$EDITOR'				# Open files with default editor
alias bat='bat -A'					# bat command with option to show non-printable characters
alias l='eza -l --icons=always'		# List files in long format with icons
alias ls='eza -a --icons=always'	# List all files (including hidden) with icons
alias ll='eza -al --icons=always'	# List all files in long format with icons
alias lt='eza -a --tree --level=1 --icons=always'	# Display tree view of current dir, depth=1
alias rm='rm -i'					# Prompt before removing files
alias mv='mv -i'					# Prompt before overwriting while moving files
alias cp='cp -i'					# Prompt before overwriting while copying files
alias mkdir='mkdir -pv'				# Make directories, show progress, create parents as needed
alias sha256='sha256sum'			# Compute SHA-256 checksum
alias xtar='tar -xzvf'				# Extract tar archives
alias ctar='tar -czvf'				# Create tar archives
alias fzf='fzf --preview "bat -A --color=always --style=numbers --line-range=:500 {}"' # Fuzzy finder Preview


# -------------------------------
# Package Management (Pacman)
# -------------------------------
alias search='sudo pacman -Ss'		# Search for a package
alias add='sudo pacman -S'			# Install a package
alias update='sudo pacman -Syu'		# Update system (sync + upgrade)
alias delete='sudo pacman -Rns'		# Remove a package and unused dependencies
alias cleancache="sudo pacman -Scc"	# Clear pacman cache
alias fixpacman="sudo rm /var/lib/pacman/db.lck"	# Fix pacman lock issue
alias cleanup="sudo pacman -Rns \$(pacman -Qtdq)"	# Cleanup orphaned packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"	# Show recently installed packages with timestamps


# -------------------------------
# Git Shortcuts
# -------------------------------
alias gs='git status'					# Show git status
alias ga='git add'						# Stage changes
alias gc='git commit'					# Commit staged changes
alias gp='git push'						# Push changes to remote
alias gpl='git pull'					# Pull latest code from remote
alias gplr='git pull --rebase'			# Pull with rebase to keep linear history
alias glog='git log --oneline --decorate --graph'	# Pretty git log
alias gco='git checkout'				# Checkout branch/commit
alias gb='git branch'					# List branches
alias gcm='git checkout main'			# Checkout 'main' branch quickly
alias gst='git stash'					# Stash current changes
alias gsta='git stash apply'			# Reapply last stash
alias gstd='git stash drop'				# Delete last stash
alias gd='git diff'						# Show changes
alias gds='git diff --staged'			# Show staged changes
alias gundo='git reset --soft HEAD~1'	# Undo last commit but keep changes staged
alias lg='lazygit'						# Show lazygit


# -------------------------------
# System Monitoring
# -------------------------------
alias df='df -h'					# Show disk usage in human-readable format
alias meminfo='free -m -l -t'		# Show memory usage info in MB
alias cpuinfo='lscpu'				# Show CPU details
alias cpu='top -o %CPU'				# Top sorted by CPU usage
alias mem='top -o %MEM'				# Top sorted by memory usage
alias jctl="journalctl -p 3 -xb"	# Get error messages from journalctl


# -------------------------------
# Networking
# -------------------------------
alias ports='netstat -tulanp'			# Show open ports and listening services
alias ports-listening='netstat -tuln'	# Show only listening TCP/UDP ports
alias myip='curl http://ipecho.net/plain; echo'	# Display public IP address
alias flushdns='sudo systemctl restart nscd'	# Flush DNS cache
alias wifi='nmtui'						# Open NetworkManager TUI interface'
alias ping='ping -c 5'					# Ping with 5 packets by default


# -------------------------------
# System Control
# -------------------------------
alias reboot='systemctl reboot'			# Reboot system
alias shutdown='systemctl poweroff'		# Shutdown system
alias logout='hyprctl dispatch exit; systemctl restart greetd'	# Logout system
