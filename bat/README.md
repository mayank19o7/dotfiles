# 🦇 Bat Configuration

This directory contains my **[bat](https://github.com/sharkdp/bat)** setup — a modern replacement for `cat` with **syntax highlighting**, **themes**, and **git integration**.
The configuration is managed using **GNU Stow** to keep dotfiles modular and easy to maintain.

---

## 📁 Structure

```
bat/
├── .config/
│   └── bat/
│       ├── config              # Main configuration
│       └── themes/             # Custom themes
│           └── Vague.tmTheme
```

### **`config`**

Defines bat’s behavior — theme selection, style options, and paging rules.

### **`themes/`**

Contains custom themes for bat.
Here, I use **Vague.tmTheme**, a soft and minimal theme that gives bat an elegant highlighting style.

---

## ⚙️ Installation (using GNU Stow)

From your dotfiles root directory (e.g. `~/Dotfiles`):

```bash
stow bat
```

This creates symlinks in your home directory as:

```
~/.config/bat -> Dotfiles/bat/.config/bat
```

To remove the symlink:

```bash
stow -D bat
```

---

## 🎨 Theme Setup

To enable the custom theme:

1. Place your `.tmTheme` inside:

   ```
   ~/.config/bat/themes/
   ```
2. Rebuild bat’s theme cache:

   ```bash
   bat cache --build
   ```
3. Set it in `config`:

   ```
   --theme="Vague"
   ```

---

## ♻️ Clearing & Rebuilding the Cache

If you update or replace a theme, bat may still use the old cached version.
To fix this, **clear the theme cache** and **rebuild** it:

```bash
bat cache --clear
bat cache --build
```

This ensures bat loads the latest version of your custom theme.

---

## 🧩 Usage

Once configured, bat automatically loads the custom theme and applies it whenever you run:

```bash
bat file.txt
```
