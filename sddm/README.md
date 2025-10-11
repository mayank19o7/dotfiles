# 🎨 SDDM Theme Installation & Configuration Guide

This guide explains how to **install, configure, and customize** a theme for **SDDM** (Simple Desktop Display Manager).

---

## ⚙️ Prerequisites

* **SDDM** must be installed and enabled as your system’s display manager.
* **Root privileges** are required to install or configure system-wide themes.

---

## 📦 Download & Extract the Theme

1. Browse and download a theme from [KDE Store](https://store.kde.org).

2. Extract the downloaded archive:

```bash
tar -xvf sugar-candy.tar.gz
```
or use zsh's extract plugin
or use your preferred GUI archive manager.

---

## 📁 Install the Theme

1. Move the extracted theme folder to the SDDM theme directory:

```bash
sudo mv theme-folder /usr/share/sddm/themes/
```
2. Ensure the folder name matches the theme’s internal name (as specified in its `metadata.desktop`).

---

## 🧩 Configure SDDM

1. Edit the SDDM configuration file:

	* **System-wide:** `/etc/sddm.conf`
	* **User override (recommended):** `/etc/sddm.conf.d/theme.conf.user`

2. Add or modify the `[Theme]` section:

```ini
[Theme]
Current=theme-folder-name
```

3. Save and close the file.

---

## 🔄 Apply the Theme

Restart SDDM to apply the new theme:

```bash
sudo systemctl restart sddm
```

Alternatively, reboot your system.

Once restarted, the **new login theme** should be active.

---

## 🎨 Customize the Theme

* **Background:**
	Edit the theme’s `theme.conf` or create a `theme.conf.user` inside the theme folder:

```ini
Background=/path/to/your/background.jpg
```
* **Other Options:**
	Themes often support settings like **time format**, **blur strength**, **accent colors**, etc.
	Check the theme’s `README` or `theme.conf` for available parameters.

---

## 👀 Preview Without Logging Out

Test how a theme looks without restarting SDDM:

```bash
sddm-greeter --test-mode --theme /usr/share/sddm/themes/theme-folder-name
```

---

## 🧰 Troubleshooting

* Ensure required **Qt dependencies** are installed:

```bash
sudo pacman -S qt5-quickcontrols2 qt5-graphicaleffects qt5-svg
```
* Verify that:
	* The theme directory exists under `/usr/share/sddm/themes/`
	* The `Current` value in the config matches the directory name.

---

✅ **You’re all set!**
Your system should now display the new, customized SDDM login screen.
