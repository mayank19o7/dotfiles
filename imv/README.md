# 🖼️ imv Configuration

This directory contains my **[imv](https://github.com/eXeC64/imv)** configuration — a clean and minimal **image viewer setup** for Wayland/X11 environments.
The configuration is organized for use with **GNU Stow**, keeping it modular and easy to maintain across systems.

---

## 🗂️ Structure

```
imv/
│── .config/
│   └── imv/
│       └── config    # Main imv configuration
```

---

## 🎨 Configuration Details

### `config`

* Scaling and display behavior
* Background and UI preferences
* Smooth and minimal viewing workflow
* Supports custom keybindings for navigation, see [Arch Docs](https://man.archlinux.org/man/imv.5.en) for more details.

---

## 🔗 Linking with GNU Stow

From your dotfiles root directory (e.g. `~/Dotfiles`):

```bash
stow imv
```

This creates home symlinks as:

```
~/.config/imv -> Dotfiles/imv/.config/imv
```

To remove the symlink:

```bash
stow -D imv
```

---

## 🪄 Usage

### Open an image

```bash
imv <image>
```

### Open an entire directory as a gallery

```bash
imv .
```

### Navigate (example workflow)

* **j/k** or **←/→** to move between images
* **q** to quit
* **+/-** to zoom

---

## 🗒️ Notes

* Works seamlessly under **Hyprland** and other Wayland compositors.
* Supports many formats including PNG, JPG, GIF, WebP and HEIC with `libheif`.
* Set your preferred background color and scaling behavior in the config file.
