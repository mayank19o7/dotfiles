# ⚙️ Neovim Configuration

This directory contains my **Neovim setup**, written entirely in **Lua**, managed with **[lazy.nvim](https://github.com/folke/lazy.nvim)** as a plugin manager.
It’s organized into modular files for maintainability and fast startup.

---

## 🧠 Overview

The configuration is modular:

* **`lua/config/`** → core settings and keymaps
* **`lua/plugins/`** → individual plugin configs
* **`init.lua`** → the main entry point
* **`lazy-lock.json`** → pinned plugin versions for reproducibility

Everything lives inside a `nvim/` directory that can be symlinked to `~/.config/nvim` using Stow.

---

## 📂 Structure

```
nvim/
├── init.lua                # Entry point, loads core config and plugins
├── .luarc.json             # Lua language server settings
├── lazy-lock.json          # Plugin version lockfile
└── lua/
    ├── config/             # Core editor configuration
    │   ├── keymaps.lua     # Keybindings and shortcuts
    │   ├── lazy.lua        # Lazy.nvim setup and plugin loading
    │   └── options.lua     # General Neovim options and settings
    │
    └── plugins/                    # Individual plugin configurations
        ├── autopairs.lua           # Auto-close brackets, quotes, etc.
        ├── colorizer.lua           # Color preview in code
        ├── completions.lua         # Autocompletion (e.g. nvim-cmp)
        ├── lualine.lua             # Statusline configuration
        ├── mason-lspconfig.lua     # LSP installer and integration
        ├── noice.lua               # UI enhancements (messages, cmdline)
        ├── snacks.lua              # Custom utility plugins or extras
        ├── themes.lua              # Colorscheme and appearance
        └── treesitter.lua          # Syntax highlighting & code parsing

```
---

## 🚀 Features

* 🧩 **Plugin Management** — using [lazy.nvim](https://github.com/folke/lazy.nvim)
* 🎨 **Custom UI** — theming with `lualine`, `colorizer`, and `noice`
* 🧠 **Intelligent Editing** — completions, LSP, and Treesitter integration
* ⚡ **Modular Structure** — every feature isolated for readability
* 🧷 **Version Locking** — reproducible plugin installs via `lazy-lock.json`

------

## 🪄 Setup

1. **Install dependencies**

   ```bash
   sudo pacman -S neovim git nvm
   ```
   *Note* : install nodejs using nvm

2. **🔗 Linking with GNU Stow**

   From your dotfiles root directory (e.g. `~/Dotfiles`):
   ```bash
   stow nvim
   ```
   This creates symlinks in your home directory as:
   ```
   ~/.config/nvim -> Dotfiles/nvim/.config/nvim
   ```
   To remove the symlink:
   ```bash
   stow -D nvim
   ```

3. **Launch Neovim**

   ```bash
   nvim
   ```

   On first launch, `lazy.nvim` will automatically install and sync plugins.

---

## 🧰 Customization

* Add or disable plugins in `lua/config/lazy.lua`
* Change keymaps in `lua/config/keymaps.lua`
* Modify editor behavior in `lua/config/options.lua`
* Theme switching is handled in `lua/plugins/themes.lua`

---

## 🧹 Maintenance

To update plugins:

```bash
:Lazy update
```

To check plugin health:

```bash
:checkhealth
```
