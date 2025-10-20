# 🪟 Hyprland Setup

This directory contains my **Hyprland** configuration files and startup scripts — part of my **dotfiles** managed using **GNU Stow**.

---

## 📂 Structure

```
hypr/
├── .config/
│   └── hypr/
│       ├── environment.conf 	# Environment variables for Wayland, GTK, etc.
│       ├── globals.conf 		# Global variables used across configs
│       ├── autoStart.conf 		# Applications/services launched at startup
│       ├── monitors.conf 		# Display arrangement and scaling
│       ├── variables.conf 		# General, decaoratin and Misc options
│       ├── layout.conf 		# Tiling gaps, borders, and workspace layout
│       ├── animations.conf 	# Animation speeds, curves, and transition effects
│       ├── input.conf 			# Keyboard, mouse, and touchpad settings
│       ├── keybinds.conf 		# Keybindings and shortcuts
│       ├── windowRules.conf 	# Rules for specific windows and apps
│       ├── hyprland.conf 		# Main Hyprland configuration (sources all above)
│       ├── hypridle.conf 		# Idle and suspend management
│       ├── hyprlock.conf 		# Lock screen configuration
│       └── hyprpaper.conf 		# Wallpaper configuration
│
├── start-hyprland 				# Startup script for Hyprland session
├── .stow-local-ignore 			# Files ignored during stow linking
└── README.md 					# This file
```

---

## ⚙️ LLinking with GNU Stow

From your dotfiles root directory (e.g. `~/Dotfiles`):
```bash
stow hypr
```

This creates symlinks in your home directory so that Hyprland and its related tools read configuration directly from this repository.

```
~/.config/hypr -> Dotfiles/hypr/.config/hypr
```

To remove the symlink:
```bash
stow -D hypr
```

---

## 🚀 `start-hyprland`

This script is invoked by **greetd** (via `config.toml`) to launch an Hyprland session.

### 🧠 Purpose
* Starts the **Hyprland** compositor.
* Hides compositor logs from the TTY while logging output to `$HOME/.local/share/hyprland.log`.
* Exports environment variables required for Wayland, GTK, and portal compatibility.
* Works seamlessly whether started manually or via **greetd** / **tuigreet**.

---

### 📦 Installation

Install the script to a directory in your `$PATH`, for example:

```bash
sudo cp start-hyprland /usr/local/bin/

# To make it executable
chmod +x /usr/local/bin/start-hyprland
```

---

### ⚙️ Integration with Greetd

Example snippet for `/etc/greetd/config.toml` to start Hyprland using **tuigreet**:

```toml
[default_session]
command = "tuigreet --cmd start-hyprland"
```

---

## 🧩 Notes

* You can adjust per-monitor settings, animations, gaps, and window rules inside the hyprland main configuration.
* Combine this setup with utilities like:
  * `waybar` or `eww` for status bars
  * `fuzzel` or `rofi-wayland` for app launchers
  * `mako` or `dunst` for notifications
* For `Start-hyprland`
  * Ensure the script is **executable** and accessible in `$PATH`.
  * Logs are helpful for diagnosing startup or environment issues.
  * Some logs are also controlled by [Hyprland’s debug variable](https://wiki.hypr.land/Configuring/Variables/#debug) : if `disable_logs = false`, additional logs are stored in `$XDG_RUNTIME_DIR/hypr/<instanceSignature>/hyprland.log` during active sessions.
  * Mirrors how Greetd runs your session automatically after login.
