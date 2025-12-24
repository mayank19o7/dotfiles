# 🎨 Matugen Configuration

This directory contains my **[Matugen](https://github.com/InioX/matugen)** configuration — a dynamic color scheme generator that creates palettes from images and applies them across my system (Wayland-focused setup).

The configuration is structured for **GNU Stow**, keeping everything modular and easy to sync across machines.

---

## 📂 Structure

```
matugen/
└── .config/
    └── matugen/
        ├── templates/        # Custom output templates (CSS, JSON, etc.)
        └── config.toml       # Main Matugen configuration
```

---

## ⚙️ Configuration Details

### `config.toml`

* Defines the **backend** (e.g. `wal`, `material-you`)
* Sets the **color mode** (dark / light)
* Controls template rendering paths
* Manages wallpaper → palette generation behavior

---

### `templates/`

Contains **custom Matugen templates** used to export generated colors into formats consumed by other applications, such as:

* Waybar
* GTK themes
* Terminal themes
* CSS / JSON configs for scripts

Templates allow Matugen to act as a **central color source** for the entire system.

---

## 🔗 Linking with GNU Stow

From your dotfiles root (e.g. `~/Dotfiles`):

```bash
stow matugen
```

This creates the symlink:

```
~/.config/matugen -> Dotfiles/matugen/.config/matugen
```

To remove it:

```bash
stow -D matugen
```

---

## 🪄 Usage

Generate a color scheme from an image:

```bash
matugen image path/to/wallpaper.jpg
```

Apply colors using your templates automatically.

---

## 💡 Notes

* Designed to integrate with **Hyprland + Waybar + GTK**
* Works best when paired with wallpaper managers like **Waypaper**
* Templates are compositor-agnostic and reusable
