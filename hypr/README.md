# 🪟 Hyprland Setup

This directory contains my **Hyprland** configuration files and startup scripts.

---

## 🚀 `start-hyprland`

This script is invoked by **greetd** (via `config.toml`) to launch a Hyprland session.

### 🧠 Purpose
- Starts the **Hyprland** compositor  
- Hides compositor logs from the TTY while logging all output to `$HOME/.local/share/hyprland.log`.
- Sets required environment variables before launch.
- Intended for use with greetd or with/without login managers.

---

### 📦 Installation

Place the script somewhere in your `$PATH` folders, for example:

```bash
sudo cp start-hyprland /usr/local/bin/

# To make it executable
chmod +x /usr/local/bin/start-hyprland   
```

---

### ⚙️ Integration with Greetd

Edit `/etc/greetd/config.toml`, to use the script via **tuigreet**:

```toml
[default_session]
command = "tuigreet --cmd start-hyprland"
```

---

### 🧩 Notes

* Ensure the script is **executable** and accessible in `$PATH`.
* Logs are useful for debugging startup or environment issues.
* Some logs are also controlled by [Hyprland’s debug variable](https://wiki.hypr.land/Configuring/Variables/#debug) : if `disable_logs = false`, additional logs are stored in `$XDG_RUNTIME_DIR/hypr/<instanceSignature>/hyprland.log` during active sessions.
* Mirrors how Greetd runs your session automatically after login.
