# wlogout with Blur in Hyprland

[wlogout](https://github.com/ArtsyMacaw/wlogout) is a simple logout menu for Wayland compositors.
This guide explains how to configure **wlogout** to appear with a **blurred background** in **Hyprland** using layer rules.

### Enable Blur in Hyprland

Add the following to your **Hyprland config** (`~/.config/hypr/hyprland.conf`):

```ini
# Blur settings
decoration {
    blur {
        enabled = true
        size = 8
        passes = 3
    }
}

# Make wlogout use blur
layerrule = blur, ^(wlogout)$ or logout_dialog
layerrule = ignorezero, ^(wlogout)$ or logout_dialog
```

### Explanation:

* `layerrule = blur, ^(wlogout)$` → applies blur effect to the **wlogout** layer.
* `layerrule = ignorezero, ^(wlogout)$` → ensures transparency is handled correctly.
