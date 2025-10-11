# ⚡ Fastfetch Configuration

This directory contains my **Fastfetch** setup — a modern, fast, and highly customizable alternative to Neofetch.
It displays system information in the terminal with themed logos and presets.

---

## 📂 Structure

```
fastfetch/
├── .config/
│   └── fastfetch/
│       ├── ascii/                # (optional) ASCII logos or templates
│       ├── logos/                # PNG logos for random selection
│       │   ├── *.png
│       ├── presets/
│       │   └── terminal.jsonc    # Main preset for terminal mode
│       └── config.jsonc          # Default Fastfetch configuration
```

---

## 🧠 Features

* **🎨 Random Logo Loader** Loads random PNGs from the `logos/` directory at each run for variety.

* **⚙️ Default Configuration** The default config file `config.jsonc`:
	* Uses the default system logo.
	* Runs automatically with `fastfetch`.
	* Includes nearly all modules to show complete system information.

* **🧾 Preset Configuration** The `presets/terminal.jsonc` file defines:
	* Logo settings (`height`, `padding`, `source`)
	* Modules for user info, OS, uptime, etc.
	* Additional modules for current WM, theme, and system appearance.

* **💻 Terminal Optimized** The terminal preset is tuned for clean, aligned output inside terminal emulators.

---

## 🪄 Usage

* **Run with default configuration (full system info):**

```bash
fastfetch
```

* **Run with the preset configuration:**

```bash
fastfetch --config ~/.config/fastfetch/presets/terminal
```

* **Autostart in Zsh:**

```bash
if [[ $(tty 2>/dev/null) == *"pts"* ]]; then
	# ~/.config/fastfetch/presets should have a terminal.jsonrc to be used/auto-started in zsh.
	if command -v fastfetch >/dev/null 2>&1; then
		fastfetch --config "$HOME/.config/fastfetch/presets/terminal" 2>/dev/null || true

		# Clears the terminal after pressing any key.
		echo
		echo "Press any key to clear..."
		read -k 1 -s
		clear
	fi
fi
```

---

## 🔗 Linking with GNU Stow

From your dotfiles root directory (e.g. `~/Dotfiles`):

```bash
stow fastfetch
```

This creates symlinks in your home directory as:

```
~/.config/fastfetch -> Dotfiles/fastfetch/.config/fastfetch
```

To remove the symlink:

```bash
stow -D fastfetch
```

---

## 📸 Preview

Random logos displayed alongside your system info — every terminal launch feels unique ⚡
