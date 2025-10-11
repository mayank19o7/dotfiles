# 📝 Micro Editor Configuration

This directory contains my **Micro** text editor configuration and custom themes.

---

## 📂 Structure

```
micro/
├── colorschemes/      # Custom color themes
└── settings.json      # Main Micro configuration file
```

---

## ⚙️ Installation (with GNU Stow)

To link this configuration into your system:

```bash
stow micro
```

This will create the symlink:

```
~/.config/micro → ~/Dotfiles/micro/.config/micro
```

---

## 🎨 Themes

Custom themes are stored under:
```
~/.config/micro/colorschemes/
```
You can switch between them within Micro using:
```
> set colorscheme <theme-name>
```
or edit the settings.json
```
"colorscheme" : "<theme-file-name>"
```

---

## 🧩 Notes

* `settings.json` defines key preferences, indentation, color schemes, and editor behavior.
* Ideal for minimal setups — fast, lightweight, and consistent across systems.
