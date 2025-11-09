# 📝 Micro Editor Configuration

This directory contains my **[Micro](https://github.com/zyedidia/micro)** text editor configuration, keybindings, plugins, and custom themes.

---

## 📂 Structure

```
micro/
├── .config/
│       micro/
│       ├── colorschemes/      # Custom color themes
│       ├── settings.json      # Main Micro configuration file
│       ├── bindings.json      # Custom keybindings for Micro
│       └── plug/              # Plugins directory (created automatically when installing plugins).
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

## ⌨️ Keybindings

Custom key mappings are defined in:
```
~/.config/micro/bindings.json
```

Example: for manipulator plugin
```json
{
  "Ctrl-l": "command:lower",
  "Ctrl-u": "comman:upper"
}
```

Reload bindings after changes:
```
> reload
```
---

## 🔌 Plugins

Plugins enhance Micro’s functionality. They are installed in:
```
~/.config/micro/plug/
```

To install or manage plugins:
```
> plugin install <plugin-name>
> plugin list
> plugin update
```
---

## 🧩 Notes

* `settings.json` defines preferences like indentation, color scheme, and UI behavior.
* Designed for minimal setups — **fast**, **lightweight**, and **consistent** across systems.
* Easily portable via **GNU Stow**.
