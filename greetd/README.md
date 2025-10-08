# 🧑‍💻 greetd + tuigreet Setup Guide

A lightweight, terminal-based login manager setup for any Wayland/X11 environment.

---

## 🧩 Overview

**greetd** is a minimal, flexible display/login manager daemon.
**tuigreet** is its TUI (Text User Interface) frontend, providing a clean and efficient login prompt that works seamlessly with both **Wayland** and **X11** sessions.

Together, they form a fast and simple alternative to graphical login managers.

---

## 📦 Installation

Install both `greetd` and `tuigreet`:

```bash
sudo pacman -S greetd-tuigreet
```

---

## ⚙️ Configuration

### 1. Edit the greetd configuration file

Open (or create) `/etc/greetd/config.toml`:

```bash
sudo micro /etc/greetd/config.toml
```

Replace its contents with the following minimal configuration (or replace the file entirely with a provided `config.toml`):

```toml
[terminal]
vt = 1

[default_session]
command = "tuigreet --cmd Hyprland"
user = "greeter"
```

---

### 2. Common `--cmd` Options

| Environment          | Command Example               |
| -------------------- | ----------------------------- |
| Hyprland (Wayland)   | `--cmd 'Hyprland'`            |
| Sway (Wayland)       | `--cmd 'sway'`                |
| GNOME (Wayland)      | `--cmd 'gnome-session'`       |
| KDE Plasma (Wayland) | `--cmd 'startplasma-wayland'` |
| X11 (Fallback)       | `--cmd 'startx'`              |

---

### 3. Useful tuigreet Flags

| Flag                                      | Description                                                                                                                                                                                                                                               |
| ----------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `--time`                                  | Show the current time                                                                                                                                                                                                                                     |
| `--remember`                              | Remember the last logged-in username                                                                                                                                                                                                                      |
| `--remember-session`                      | Remember the last selected session                                                                                                                                                                                                                        |
| `--asterisks`                             | Mask password input with asterisks                                                                                                                                                                                                                        |
| `--window-padding`, `--container-padding` | Adjust layout padding                                                                                                                                                                                                                                     |
| `--width`                                 | Set interface width                                                                                                                                                                                                                                       |
| `--greeting`                              | Display a custom welcome message                                                                                                                                                                                                                          |
| `--theme`                                 | **Apply a custom theme using `;`-separated parameters**, where each parameter defines a UI component color in the format `component=color`. Colors can use **named ANSI colors** (e.g., `red`, `lightmagenta`, `cyan`) or **256-color codes** (`0–255`).  |
| `--cmd`                                   | Define session to start after login                                                                                                                                                                                                                       |

---

## 🚀 Enabling greetd

Enable and start the greetd service:

```bash
sudo systemctl enable greetd
sudo systemctl start greetd
```

Check service status:

```bash
systemctl status greetd
```

---

## 🧰 Troubleshooting

### 🕶️ Black Screen or No Login Prompt

Switch to another TTY (`Ctrl + Alt + F2`) and check greetd logs:

```bash
journalctl -u greetd
```

### 💥 Wayland Session Fails to Start

Ensure your compositor (e.g., `Hyprland`, `sway`) is correctly installed and configured.

---

## 📝 Notes & Tips

### 🌐 Ensure UTF-8 Locale Is Set

Make sure your system locale is configured for UTF-8 to avoid character display issues:

```bash
sudo localectl set-locale LANG=en_US.UTF-8
```

Verify configuration:

```bash
locale
```

Ensure `LANG` and related variables use a UTF-8 locale (e.g., `en_US.UTF-8`).

---

### 🔠 Increase Console Font Size (TTY)

If the login prompt text appears too small, install and apply a larger font such as **Terminus**:

```bash
sudo pacman -S terminus-font
```

To test temporarily:

```bash
setfont ter-v28b
```

To make it **persistent** across reboots, edit `/etc/vconsole.conf`:

```bash
sudo micro /etc/vconsole.conf
```

Add or modify:

```
FONT=ter-v28b
```

Rebuild initramfs (optional but recommended):

```bash
sudo mkinitcpio -P
```

---

## 🧽 Uninstallation

To disable and remove greetd and tuigreet:

```bash
sudo systemctl disable greetd.service
sudo pacman -Rns greetd tuigreet
```

*(Adjust package commands for non-Arch distributions.)*

---

## 📚 References

* [tuigreet on GitHub](https://github.com/apognu/tuigreet)
* [Arch Wiki: greetd](https://wiki.archlinux.org/title/Greetd)

---
