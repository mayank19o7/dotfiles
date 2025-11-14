# 📊 BTOP Configuration

A clean and minimal configuration for **btop**, managed using **GNU Stow**.

This directory contains my customized `btop` setup, including theme overrides and the main configuration file.

---

## 📁 Structure

```
btop/
├── .config/
│   └── btop/
│       ├── themes/      # Custom themes
│       └── btop.conf    # Main configuration
```

---

## ⚙️ Installation (using GNU Stow)

From your dotfiles root directory (e.g. `~/Dotfiles`):

```bash
stow btop
```

This creates symlinks in your home directory as:

```
~/.config/btop -> Dotfiles/btop/.config/btop
```

To remove the symlink:

```bash
stow -D btop
```

---

## 📝 Notes

* You can modify or add themes inside `themes/`.
* After updating the configuration, reload btop to apply changes.

---

## 🎨 Customization

* Edit `btop.conf` to change colors, layout, CPU graphs, update intervals, and more.
* Place any custom `.theme` files inside the `themes` directory.

---
