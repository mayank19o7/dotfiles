# 📸 `Screenshot Utility` 

[screenshot](.config/hypr/scripts/screenshot) - a **unified utility** for **Wayland / Hyprland**, combining tools like `grim`, `slurp`, `wl-copy`, `swappy`, and `dunstify`.
Designed for a seamless screenshot experience — capture, copy, or edit with minimal effort.

---

## ⚙️ Overview

This script provides **three modes** for different screenshot workflows:

| Mode        | Description                                                                                    |
| ----------- | ---------------------------------------------------------------------------------------------- |
| `area-copy` | Select a rectangular area, save it, and copy the image to the clipboard.                       |
| `area-edit` | Select a region and open it directly in **Swappy** for annotation or editing.                  |
| `full`      | Capture the **currently active monitor** automatically (based on Hyprland’s active workspace). |

All screenshots are saved in `~/Pictures/` with filenames formatted as:

```
screenshot_YYYY-MM-DD_HH-MM-SS.png
```

---

## 🧠 Dependencies

Make sure the following packages are installed:

| Tool                  | Purpose                               |
| --------------------- | ------------------------------------- |
| `grim`                | Capture Wayland screenshots           |
| `slurp`               | Select screen region interactively    |
| `wl-copy`             | Copy image data to clipboard          |
| `swappy`              | Annotate or edit screenshots          |
| `jq`                  | Parse JSON output from Hyprland       |
| `hyprctl`             | Query active workspace / monitor info |
| `dunstify`            | Send desktop notifications            |
| `paplay` (PulseAudio) | Play shutter sound                    |

---

## 🚀 Usage

```bash
screenshot [mode]
```

### Examples

```bash
screenshot area-copy   # Select area → save & copy to clipboard
screenshot area-edit   # Select area → open in Swappy for editing
screenshot full        # Capture full screen of active monitor
```

Each action will play a **camera shutter sound** and show a **notification** confirming success or failure.

---

## 🧩 Integration Tips

You can bind the script to shortcuts in your **Hyprland**, **Waybar**, or **Wofi** setup.

Example Hyprland keybinds:

```ini
bind = , PRINT, exec, ~/.config/scripts/screenshot area-copy
bind = $mod, PRINT, exec, ~/.config/scripts/screenshot area-edit
bind = $mod SHIFT, PRINT, exec, ~/.config/scripts/screenshot full
```

---

## 📂 Output

* **Directory:** `~/Pictures`
* **Format:** `screenshot_YYYY-MM-DD_HH-MM-SS.png`

---

## 📝 Notes

* If you prefer another sound or none at all, you can replace or comment out the `paplay` line.
