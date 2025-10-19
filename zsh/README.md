# ⚡ Zsh Configuration

Personal **Z Shell (zsh)** setup, managed with **GNU Stow** for clean, reproducible dotfile management.
Includes modular configuration, useful plugins, a customized **Powerlevel10k** prompt, and a minimal but powerful shell experience.

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
* Beautiful and fast **Powerlevel10k** prompt

---

## 📦 Structure

```
zsh/
├── .zshrc                     # Main zsh entrypoint
├── .p10k.zsh                  # Powerlevel10k theme
└── .config/zsh/config.d/      # Modular configs
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
  extract
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-history-substring-search
)
```

> 📝 Only set if `$plugins` isn’t already defined (avoids overwrite from other configs).

---

## 🎨 Powerlevel10k Prompt

The theme is configured via **`.p10k.zsh`**, which defines prompt style, colors, icons, and segments.

To use it:

1. Install Powerlevel10k (via Oh My Zsh):

   ```bash
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
   ```

2. Set the theme in your `.zshrc`:

   ```bash
   ZSH_THEME="powerlevel10k/powerlevel10k"
   ```

3. Restart your terminal.
   If not configured yet, Powerlevel10k will launch a setup wizard.

> ⚡ You can reconfigure anytime by running:
>
> ```bash
> p10k configure
> ```

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
   git clone https://github.com/mayank19o7/dotfiles.git ~/Dotfiles
   cd ~/Dotfiles
   ```

2. Stow the `zsh` folder:
   ```bash
   stow zsh
   ```

   This will create symlinks:
   ```
   ~/.zshrc                →  ~/Dotfiles/zsh/.zshrc
   ~/.p10k.zsh             →  ~/Dotfiles/zsh/.p10k.zsh
   ~/.config/zsh/config.d/ →  ~/Dotfiles/zsh/.config/zsh/config.d/
   ```

3. Restart Terminal.
4. To remove the symlink:
	```bash
	stow -D zsh
	```

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
* `.p10k.zsh` manages prompt appearance and can be customized anytime.
* Works seamlessly with other Stow-managed dotfiles (e.g., `kitty`, `fastfetch`, `hypr`, etc.).
