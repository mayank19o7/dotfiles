# ⚡ Zsh Configuration

Personal **Z Shell (zsh)** setup, managed with **GNU Stow** for clean, reproducible dotfile management.
Includes modular configuration, useful plugins, and a minimal but powerful shell experience.

---

## 🧠 Overview

This configuration uses **Oh My Zsh** as a base and loads extra settings from modular files under
`~/.config/zsh/config.d/`.

### ✨ Features

* Modular and organized config structure
* Lightweight, fast shell startup
* Autosuggestions and syntax highlighting
* Fuzzy finder (`fzf`) integration
* Clean history and alias management

---

## 📦 Structure

```
zsh/
├── .zshrc                     # Main zsh entrypoint
└── _config/zsh/config.d/      # Modular configs
    ├── 00-exports.zsh
    ├── 10-options.zsh
    ├── 20-aliases.zsh
    ├── 30-autostart.zsh
    └── ...
```

---

## ⚙️ Oh-My-Zsh Plugins

```bash
plugins=(
  git
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-history-substring-search
)
```

> 📝 Only set if `$plugins` isn’t already defined (avoids overwrite from other configs).

---

## 🧩 Modular Config Loading

`.zshrc` automatically loads all `.zsh` files from `~/.config/zsh/config.d/`:

```bash
for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
  source "${conf}"
done
```

This allows you to split configuration logically:

* `00-exports.zsh` → environment variables
* `10-options.zsh` → shell options
* `20-aliases.zsh` → aliases and shortcuts
* `30-autostart.zsh` → startup programs

---

## 🚀 Installation (Using GNU Stow)

1. Clone your dotfiles:

   ```bash
   git clone https://github.com/<your-username>/my-dotfiles.git ~/Dotfiles
   cd ~/Dotfiles
   ```

2. Stow the `zsh` folder:

   ```bash
   stow zsh
   ```

   This will create symlinks:

   ```
   ~/.zshrc  →  ~/Dotfiles/zsh/.zshrc
   ~/.config/zsh/config.d/  →  ~/Dotfiles/zsh/_config/zsh/config.d/
   ```

3. Restart Terminal.

---

## 🔌 Recommended Plugins

If not already installed:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
```

---

## 🧼 Notes

* Keep plugins minimal for faster startup.
* Add new `.zsh` files under `config.d/` for cleaner organization.
* Works seamlessly with other Stow-managed dotfiles (e.g., `kitty`, `fastfetch`, `hypr`, etc.).
