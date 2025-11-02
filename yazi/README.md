# 🧭 Yazi Configuration

Personal configuration for the **[Yazi](https://yazi-rs.github.io/)** terminal file manager — a fast, minimal, and TUI-based alternative to traditional file browsers.

Managed using **GNU Stow** for reproducible and portable dotfile management.

---

## 📂 Structure

```
yazi/
└── .config/
    └── yazi/
        ├── yazi.toml              # Main configuration file
        ├── theme.toml             # Set flavor
        └── flavors/
            └── <theme-name>.yazi/
                ├── flavor.toml     # Theme flavor definition
                └── tmtheme.xml     # Syntax highlighting template
```

---

## ⚙️ Overview

| File                | Purpose                                                                                         |
| ------------------- | ----------------------------------------------------------------------------------------------- |
| **`yazi.toml`**     | Core Yazi configuration — layout, keymaps, previewers, behavior tweaks, etc.                    |
| **`theme.toml`**    | Defines interface colors and visual tweaks used across the UI.                                  |
| **`flavors/`**      | Contains modular theme variants or color “flavors.”                                             |
| **`<theme-name>.yazi/`** | Example flavor — includes `flavor.toml` for color mappings and `tmtheme.xml` for syntax themes. |

---

## 🔗 Linking with GNU Stow

From your dotfiles root directory (e.g. `~/Dotfiles`):

```bash
stow yazi
```

This will create symlinks in your home directory as:

```
~/.config/yazi -> Dotfiles/yazi/.config/yazi
```

To remove the symlink:

```bash
stow -D yazi
```

---

## 🎨 Theme Customization

You can switch or create new themes under `flavors/`.
Each theme folder follows the same structure:

```
flavors/
└── your-theme-name.yazi/
    ├── flavor.toml
    └── tmtheme.xml
```

Edit `theme.toml` or update your `yazi.toml` to point to your preferred flavor.

---
