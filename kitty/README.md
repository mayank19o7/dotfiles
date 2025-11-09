# 🐱 Kitty Configuration

This directory contains my **[Kitty terminal](https://github.com/kovidgoyal/kitty)** configuration files, including themes and appearance settings.
It is part of my **dotfiles** setup and managed using **GNU Stow** for easy symlink management.

---

## 📦 Structure

```
kitty/
├── .config/
│   └── kitty/
│       ├── kitty.conf
│       ├── <theme>.conf
```

* **`kitty.conf`** – Main configuration file; includes base settings and theme references.
* **`<theme>.conf`** – Color schemes included via `include` directive.

---

## 🔗 Linking with GNU Stow

From your dotfiles root directory (e.g. `~/Dotfiles`):

```bash
stow kitty
```

This will create symlinks in your home directory as:

```
~/.config/kitty -> Dotfiles/kitty/.config/kitty
```

To remove the symlink:

```bash
stow -D kitty
```

---

## 🎨 Configuration Overview

* **Themes:** Easily switch between custom themes using `include` directives in `kitty.conf`.
* **Appearance:**
  * `background_opacity: 0.3`
  * `background_blur: 15`
  * `dim_opacity: 0.2`
* **Font:** `JetBrainsMono Nerd Font`, size `13`
* **Cursor:** Beam shape with smooth trail and blink behavior.
* **Mouse:** Auto-hides after `3s` of inactivity.
* **Window Settings:** Padding, Window close option etc.

---

## 🧩 Customization

To use a different theme:

```bash
# In kitty.conf
include SomeOtherTheme.conf
```

Or create your own theme file under `.config/kitty/`.

---

## 🛠️ Notes

* Ensure **JetBrainsMono Nerd Font** is installed for icons and glyphs.
* Kitty configs are modular — edit or replace included themes freely.
