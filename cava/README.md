# 🎵 Cava Configuration

This directory contains my **Cava** (Console-based Audio Visualizer) configuration, including custom themes and shaders for a more personalized visualizer experience.
It is managed as part of my dotfiles and deployed using **GNU Stow**.

```
cava/
├── .config/
│   └── cava/
│        ├── shaders/    # Output shaders
│        ├── themes/     # Color gradients
│        └── config      # Main config file
```
---

## 📁 Structure

### **`config`**

Main Cava configuration file.
This controls:

* Visualizer type (bars, waves, circle, etc.)
* Sensitivity, smoothing, framerate
* Audio source (pipewire/pulse/alsa)
* Selected theme
* Shader configuration (if using GLSL rendering)

---

### **`themes/`**

Custom **Cava themes**.
Each theme file may define:

* Foreground/background colors
* Bar gradient
* Spectrum style
* Bar width, spacing, shaping, smoothing preset

You can switch themes by editing the `config` file and setting:

```
[color]
theme = theme_name
```

---

### **`shaders/`**

Custom **GLSL shaders** for advanced visuals (if enabled).
Useful when using:

* `output = glsl`
* GPU-powered bar effects
* Glow, blur, smooth transforms
* Animated shader-driven visualizers

To use a shader, reference it inside the `config` file.

---

## 🚀 Usage

### Enable Cava with your config:

```sh
cava -p ~/.config/cava/config
```

### Apply via GNU Stow:


From your dotfiles root directory (e.g. `~/Dotfiles`):

```bash
stow cava
```

This creates symlinks in your home directory as:

```
~/.config/cava -> Dotfiles/cava/.config/cava
```

To remove the symlink:

```bash
stow -D cava
```

---

## 📝 Notes

* Some shaders may require GPU support.
* Theme colors need a terminal that supports **truecolor (24-bit)**.
* Your audio backend (PipeWire/PulseAudio/ALSA) must match the one selected in the config.

---
