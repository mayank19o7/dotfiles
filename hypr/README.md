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
│       ├── hyprpaper.conf 		# Wallpaper configuration
│       └── scripts/
│           ├── start-hyprland			# Startup script for Hyprland session (used by greetd)
│           ├── setup-multigpu-udev		# Setup script for multi-GPU udev rules
│           └── remove-multigpu-udev	# Cleanup script to remove udev links
├── README.md 					# This file
└── README-MULTI-GPU.md			# Separate multi-GPU setup documentation
```

---

## ⚙️ Linking with GNU Stow

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

## 🚀 Scripts

### ▶ `start-hyprland`

Invoked by **greetd** (via `config.toml`) to launch a Hyprland session.

**Features:**
* Starts the **Hyprland** compositor.
* Hides compositor logs from the TTY while logging output to `$HOME/.local/share/hyprland.log`.
* Works seamlessly whether started manually or via **greetd** / **tuigreet**.

**Installation:** Install the script to a directory in your `$PATH`, for example:

```bash
sudo cp scripts/start-hyprland /usr/local/bin/

# make it executable
chmod +x /usr/local/bin/start-hyprland
```

**Integration (example `/etc/greetd/config.toml`):** to start Hyprland using **tuigreet**:

```toml
[default_session]
command = "tuigreet --cmd start-hyprland"
```

---

### 🖥️ Multi-GPU Scripts

Located under `scripts/` and documented in **README-MULTI-GPU.md**:

* **`setup-multigpu-udev`** → creates udev rules and symlinks for multi-GPU setups
* **`remove-multigpu-udev`** → removes udev rules and cleanup symlinks

These ensure correct GPU device mapping for Hyprland sessions on systems with both iGPU and dGPU (e.g., NVIDIA + AMD).

---

## 🧩 Notes

* You can adjust per-monitor settings, animations, gaps, and window rules inside the hyprland main configuration.
* Logs are useful for debugging startup or GPU setup issues.
* Some logs are also controlled by [Hyprland’s debug variable](https://wiki.hypr.land/Configuring/Variables/#debug) : if `disable_logs = false`, additional logs are stored in `$XDG_RUNTIME_DIR/hypr/<instanceSignature>/hyprland.log` during active sessions.
* Combine this setup with utilities like:
  * `waybar` or `eww` for status bars
  * `fuzzel` or `rofi-wayland` for app launchers
  * `mako` or `dunst` for notifications
* For `Start-hyprland`
  * Ensure the script is **executable** and accessible in `$PATH`.
  * Mirrors how Greetd runs your session automatically after login.
