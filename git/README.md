# 🧩 Git Configuration

This directory contains my **Git-related configuration**, including:

* Global Git settings (`.gitconfig`)
* **[Delta](https://github.com/dandavison/delta)** theme configuration (syntax-highlighting for diffs)
* **[Lazygit](https://github.com/jesseduffield/lazygit)** configuration

Organized for use with **GNU Stow**.

---

## 📁 Structure

```
git/
├── .gitconfig          # Global Git configuration
└── .config/
    ├── delta/
    │   └── themes.gitconfig   # Delta diff themes
    └── lazygit/
        └── config.yml         # Lazygit settings
```

---

## ⚙️ Installation (using GNU Stow)

From your dotfiles root directory (e.g. `~/Dotfiles`):

```bash
stow git
```

This creates symlinks in your home directory as:

```
~/.gitconfig -> Dotfiles/git/.gitconfig
~/.config/delta -> Dotfiles/git/.config/delta
~/.config/lazygit -> Dotfiles/git/.config/lazygit
```

To remove the symlinks:

```bash
stow -D git
```

---

## ⚙️ Git

Your main **global Git configuration** lives in:

```
~/.gitconfig
```

This includes aliases, UI tweaks, delta integration, and other global preferences.

---

## 🎨 Delta (Git Diff Enhancer)

Delta improves Git diff output with syntax highlighting.

### Theme Configuration

Located at:

```
~/.config/delta/themes.gitconfig
```

Use this file to define custom colors and styles.

To enable the theme, ensure your `.gitconfig` includes something like:

```
[delta]
    features = your_featrure_name
```

---

## 🧰 Lazygit

Configuration for Lazygit lives here:

```
~/.config/lazygit/config.yml
```

Customize UI behavior, keybinds, colors, and other TUI settings.

---

## 📦 Dependencies

* **Git** — for version control
* **Delta** — for enhanced diff output (`git-delta` package)
* **Lazygit** — TUI Git client

These tools must be installed for the configuration files in this directory to function properly.

---

## 📝 Notes

If you want to expand this setup, you can add more Git tooling configs under `.config/`.
