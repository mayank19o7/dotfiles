# 💬 Syshud Configuration

This directory contains my **[syshud](https://github.com/System64fumo/syshud)** setup — a clean and minimal **system HUD / on-screen display** configuration used in my Wayland environment.
It’s managed using **GNU Stow** for easy, modular dotfile management.

---

## 🧠 Overview

**Syshud** provides a lightweight heads-up display for showing system events like volume or brightness changes.

My configuration defines:

* Custom layout and display behavior (`config.conf`)
* Theming and animation styles (`style.css`)
* Organized under `~/.config/sys64/hud`

---

## 🗂️ Structure

```
syshud/
│── .config/
│   └── sys64/
│       └── hud/
│           ├── config.conf   # Main Syshud configuration │(behavior, position, modules)
│           └── style.css     # Styling and animation for the HUD
```

---

## 🔗 Linking with GNU Stow

From your dotfiles root directory (e.g. `~/Dotfiles`):

```bash
stow syshud
```

This will create symlinks in your home directory as:

```
~/.config/sys64/ -> Dotfiles/syshud/.config/sys64
```

To remove the symlink:

```bash
stow -D syshud
```

---

## 🎨 Configuration Details

### `config.conf`

* Controls HUD placement, duration, and active modules.
* Adjusts transparency, padding, and animation speed for a smooth visual effect.

### `style.css`

* Defines fonts, colors, borders, and animation transitions.
* Tuned for a subtle, distraction-free look.

---

## 🗒️ Notes

* Designed to complement my **Hyprland** setup visually.
* Adjust `animation-duration` and `font-size` in `style.css` to match display DPI or personal preference.
* Restart the HUD or reload its service after config changes for updates to take effect.
* **For keytoggle functionality:**
  * Only works in horizontal orientation as of now.
  * Add `keyboard` as one of the listeners in config.conf.
  * Add your keyboard device path from `/dev/input/` inside the config.
  * Add your user to the `input` group to grant permission:

    ```bash
    sudo usermod -aG input $USER
    ```
