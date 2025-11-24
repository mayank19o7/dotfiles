# 🖼️ Waypaper Configuration

This directory contains my **[Waypaper](https://github.com/anufrievroman/waypaper)** configuration — a clean and minimal **wallpaper manager** for Wayland compositors like Hyprland.
The configuration is organized cleanly for use with **GNU Stow**, keeping it modular and easy to maintain across systems.

---

## 🗂️ Structure

```
waypaper/
│── .config/
│   └── waypaper/
│       └── config.ini    # Main Waypaper configuration
```

---

## 🎨 Configuration Details

### `config.ini`

* Defines wallpaper directory
* Sets selection mode (static, random)
* Handles monitor-specific wallpaper assignment

---

## 🔗 Linking with GNU Stow

From your dotfiles root directory (e.g. `~/Dotfiles`):

```bash
stow waypaper
```

This creates home symlinks as:

```
~/.config/waypaper -> Dotfiles/waypaper/.config/waypaper
```

To remove the symlink:

```bash
stow -D waypaper
```

---

## 🪄 Usage

### Launch Waypaper UI

```bash
waypaper
```

### Reload wallpaper settings

```bash
pkill waypaper && waypaper &
```

---

## 🗒️ Notes

* Works seamlessly with **Hyprland**.
* Ensure the wallpaper directory set in `config.ini` exists.
* After changing monitor names or layout, re-open Waypaper to refresh assigned wallpaper options.
