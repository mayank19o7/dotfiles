# 📊 Waybar Configuration

This directory contains my **[Waybar](https://github.com/Alexays/Waybar)** setup — a fast, modular, and highly customizable status bar for Wayland compositors like **Hyprland**.
It provides system stats, controls, and desktop information in a clean, minimal layout.

---

## 📂 Structure

```
waybar/
├── .config/
│   └── waybar/
│       ├── config.jsonc     # Main Waybar configuration (modules, layout, settings)
│       └── style.css        # Custom CSS for styling the bar
└── README.md
```

---

## 🧠 Features

* **🧩 Modular Configuration**
  The `config.jsonc` file defines:

  * Bar layout (left, center, right modules)
  * System modules like battery, network, pulseaudio, CPU/GPU, clock, etc.
  * Custom modules for Hyprland workspaces and window title
  * Tooltips, icons, and per-module formatting

* **🎨 Themed Styling**
  The `style.css` file controls:

  * Colors, spacing, padding
  * Hover/active effects
  * Transparent / minimal theme matching the rest of the system

* **🚀 Wayland-Optimized**
  Styled and configured specifically for **Hyprland**, but compatible with any compositor supporting Waybar.

* **♻️ Auto-Reload Friendly**
  Editing the config or CSS can refresh Waybar instantly when supported.

---

## 🪄 Usage

* **Run Waybar manually (if not autostarted):**

```bash
waybar
```

* **Reload after editing config:**

```bash
killall waybar && waybar
```

* **Customize modules or styles:**
  Edit `config.jsonc` or `style.css` and restart Waybar.

---

## 🔗 Linking with GNU Stow

From your dotfiles root directory, e.g. `~/Dotfiles`:

```bash
stow waybar
```

This will create symlinks as:

```
~/.config/waybar -> Dotfiles/waybar/.config/waybar
```

To remove the symlink:

```bash
stow -D waybar
```

---

## 📸 Preview

A clean, minimal status bar with responsive modules — designed for both aesthetics and functionality.
