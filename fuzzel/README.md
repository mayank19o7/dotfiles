# 🧩 Fuzzel Launcher

This directory contains my configuration for **[fuzzel](https://codeberg.org/dnkl/fuzzel)** — a simple, fast, and Wayland-native application launcher, similar to `rofi`.

---

## ⚙️ Overview

**Fuzzel** is a minimalist Wayland menu launcher designed for speed and simplicity.
It’s often used with compositors like **Hyprland**, **Sway**, or **Wayfire**.

This setup includes my custom theming, font choices, and behavior tweaks to match the rest of my desktop environment.

---

## 📂 Structure

```
fuzzel/
├── .config/
│   └── fuzzel/
│       ├── fuzzel.ini        # Main configuration file (colors, font, layout)
│       └── themes/           # Themes files, which can be included in fuzzel.ini
```

---

## 🔗 Installation (using GNU Stow)

If you manage your dotfiles with **GNU Stow**, link the configuration from your dotfiles root directory (e.g. `~/Dotfiles`):
```bash
stow fuzzel
```

This will symlink the config directory as:
```
~/.config/fuzzel -> Dotfiles/fuzzel/.config/fuzzel
```

To remove the symlink:
```bash
stow -D fuzzel
```

---

## 🎨 Customization

* **Font:** Set in `fuzzel.ini` under `[main] → font`
* **Themes:** Controlled under `[colors]` section — adjust to match your theme (e.g., Catppuccin, Nord, Gruvbox)
* **Prompt/Icons:** You can customize `prompt` and enable icons if desired
* **Keybindings:** Launch fuzzel via a keybinding in your compositor (e.g., `$mod + SPACE`)

Example (for Hyprland):

```ini
bind = $mod, SPACE, exec, fuzzel
```
---

## 🧰 Dependencies

* **Wayland compositor** (Hyprland, Sway, etc.)
* **fontconfig** (for font rendering)
