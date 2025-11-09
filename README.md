# 🧩 My Dotfiles

A collection of **personal configuration files (dotfiles)** for managing my **Hyprland desktop and development environment** — including the shell, window manager, editors, and utilities.
Each module is **self-contained** with its own README and configuration, and managed using **GNU Stow** for easy deployment across systems.

---

## 📦 Modules

| Module                               | Description                                          |
| :----------------------------------- | :--------------------------------------------------- |
| [**Dunst**](dunst/README.md)         | Notification daemon                                  |
| [**Fastfetch**](fastfetch/README.md) | System information tool                              |
| [**Fuzzel**](fuzzel/README.md)       | Application launcher with fuzzy search               |
| [**GreetD**](greetd/README.md)       | Lightweight display/login manager with TUI interface |
| [**Hyprland**](hypr/README.md)       | Dynamic tiling Wayland compositor and window manager |
| [**Kitty**](kitty/README.md)         | GPU-accelerated terminal emulator                    |
| [**Micro**](micro/README.md)         | Terminal-based text editor                           |
| [**Neovim**](nvim/README.md)         | Extensible Vim-compatible text editor                |
| [**rEFInd**](refind/README.md)       | Boot manager for UEFI systems                        |
| [**SDDM**](sddm/README.md)           | Simple Desktop Display Manager                       |
| [**SysHud**](syshud/README.md)       | System HUD for volume and brightness indicators      |
| [**wlogout**](wlogout/README.md)     | Graphical logout and power menu                      |
| [**Yazi**](yazi/README.md)           | Terminal file manager written in Rust                |
| [**Zsh**](zsh/README.md)             | Unix shell and command interpreter                   |

---

## ✨ Highlights

* **Fully modular** — each program has its own README and configuration directory.
* **Managed with GNU Stow** — link or unlink modules easily.
* **Auto-login** support via the `start-hyprland` script (details below).
* **Multi-GPU** setup through a dedicated script, `setup-multigpu-udev` (details below).
* **Screenshot utility** script supports area and full-workspace capture with notifications.

---

## 📦 Dependencies

<details open>
<summary><b>Required Packages</b></summary>

```bash
# Prerequisites
git base-devel stow zsh kitty

# Bootloader
refind

# Login and display managers
greetd sddm

# Hyprland and ecosystem
hyprland hyprpaper hypridle hyprlock hyprpicker

# Shell integration
eza fzf oh-my-zsh (with plugins)

# Fonts
ttf-font-awesome ttf-jetbrains-mono-nerd ttf-fira-sans terminus-font

# General utilities
fastfetch yazi micro neovim dunst fuzzel wlogout

# Screenshot tools
wl-clipboard grim slurp swappy

# HUD, visuals and icons
syshud brightnessctl papirus-icon-theme breeze-icons
```

</details>

---

## 🚀 Installation

Clone the repository:

```bash
git clone https://github.com/mayank19o7/dotfiles.git ~/Dotfiles
cd ~/Dotfiles
```

### Using GNU Stow

Link a single module:

```bash
stow zsh
```

Or multiple modules:

```bash
stow hypr kitty nvim yazi
```

Each directory creates symlinks into your `~/.config`.

---

## 📝 Notes & Tips

Some configurations (like **rEFInd**, **GreetD**, and **SDDM**) must be applied manually since they do not reside under `.config`.

<details>
<summary><b>🐚 Set Zsh as Default Shell</b></summary>

To make Zsh your default login shell:

```bash
chsh -s $(which zsh)
```

</details>

<details>
<summary><b>🌐 Ensure UTF-8 Locale Is Set</b></summary>

Ensure your system locale is configured for UTF-8 to prevent character display issues.

Edit `/etc/locale.gen` and uncomment:

```
en_US.UTF-8 UTF-8
```

Then run:

```bash
sudo locale-gen
sudo localectl set-locale LANG=en_US.UTF-8
```

Verify configuration:

```bash
locale
```

Ensure `LANG` and related variables show a UTF-8 locale (e.g., `en_US.UTF-8`).

</details>

<details>
<summary><b>🖋️ TTY Font Configuration</b></summary>

To increase TTY font size using **Terminus font**:

```bash
setfont ter-v24n
```

Make it permanent by adding this line to `/etc/vconsole.conf`:

```
FONT=ter-v24n
```

Then rebuild initramfs:

```bash
sudo mkinitcpio -P
```

</details>

---

## ⚙️ Hyprland Scripts

> 🗂️ **Location:** `~/.config/hypr/scripts`

<details>
<summary><b>▶ start-hyprland</b></summary>

Launches a Hyprland session — either from **TTY (vt1)** or through **GreetD** (`config.toml`).

**Features**

* Starts the **Hyprland** compositor.
* Hides logs from TTY while saving them to `$HOME/.local/share/hyprland.log`.
* Works seamlessly when launched manually, from TTY (1), or via **GreetD / Tuigreet**.

**Installation**

```bash
sudo cp scripts/start-hyprland /usr/local/bin/
sudo chmod +x /usr/local/bin/start-hyprland
```

**Integration with Tuigreet**

Example `/etc/greetd/config.toml`:

```toml
[default_session]
command = "tuigreet --cmd start-hyprland"
```

**From TTY**

Example `~/.zprofile`:

```bash
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ] && command -v start-hyprland >/dev/null 2>&1; then
  exec start-hyprland
fi
```

</details>

<details>
<summary><b>🖥️ Multi-GPU Setup</b></summary>

Before stowing Hyprland configuration, **run the Multi-GPU setup script**
(located under `hypr/scripts/` and documented in [**README-MULTI-GPU**](hypr/README-MULTI-GPU.md)):

```bash
sudo ./setup-multigpu-udev
```

If you don’t have multiple GPUs, comment the following line in
`hypr/environment.conf` to avoid errors:

```
env = AQ_DRM_DEVICES,/dev/dri/nvidia-gpu:/dev/dri/igpu
```

**Scripts included**

* `setup-multigpu-udev` → creates udev rules and GPU symlinks
* `remove-multigpu-udev` → removes those rules and cleans up

These ensure correct GPU device mapping for hybrid setups (e.g., NVIDIA + AMD or Intel + NVIDIA).

</details>

<details>
<summary><b>📸 Screenshot Utility</b></summary>

A script for capturing screenshots — with options to **copy**, **save**, or **edit**,
and display desktop notifications on capture.

See [**README-SCREENSHOT.md**](hypr/README-SCREENSHOT.md) for more information.

</details>

---

## 🔄 Continuous Improvement

This dotfiles repository is **under continuous development and refinement**.
Configurations, scripts, and visual elements are regularly updated.
Future plans include adding a **setup script** to automate dependency installation and Stow linking for a faster, hands-free setup.
