Perfect — here’s a **refactored and polished version** of your `MULTI-GPU.md`, reorganized for clarity and smooth flow.
I’ve merged redundant sections, reordered steps logically (prepare → verify → apply → cleanup), and tightened the explanations without losing detail.

---

# 🎮 Hyprland Multi-GPU Configuration

This guide documents the setup for running **Hyprland with both NVIDIA and Intel GPUs** (Optimus / hybrid graphics).
It follows the official Hyprland [Multi-GPU guide](https://wiki.hypr.land/Configuring/Multi-GPU/) and includes simple automation scripts for managing udev rules.

---

## 🧩 Overview

Hyprland supports **multi-GPU configurations** (e.g., Intel iGPU + NVIDIA dGPU) using the `AQ_DRM_DEVICES` variable to set GPU priority.
This enables efficient rendering, offloading, and improved performance when using hybrid graphics.

---

## ⚙️ Setup Steps

### 1. Configure GPU Environment

Add the following to your Hyprland environment file (`~/.config/hypr/environment.conf`):

```conf
# --- NVIDIA / Wayland ---
env = GBM_BACKEND,nvidia-drm
env = LIBVA_DRIVER_NAME,nvidia
env = SDL_VIDEODRIVER,wayland
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
env = __NV_PRIME_RENDER_OFFLOAD,1
env = __VK_LAYER_NV_optimus,NVIDIA_only
env = WLR_RENDERER_ALLOW_SOFTWARE,1

# --- Electron (Wayland-native apps) ---
env = ELECTRON_OZONE_PLATFORM_HINT,auto
```

💡 These environment variables ensure correct rendering for Wayland, Vulkan, and OpenGL apps on hybrid systems.

Also add this to your `~/.config/hypr/variables.conf` to prevent cursor glitches:

```conf
cursor {
	no_hardware_cursors = true
}
```

---

### 2. Identify Your GPUs

List available GPUs:

```bash
lspci -d ::03xx
```

Example output:

```
00:02.0 VGA compatible controller: Intel Corporation UHD Graphics
01:00.0 VGA compatible controller: NVIDIA Corporation RTX 3060 Laptop GPU
```

---

### 3. Check Existing GPU Device Paths

Before adding custom rules, verify what currently exists:

```bash
ls -l /dev/dri/by-path
```

Example:

```
lrwxrwxrwx 1 root root  8 Oct 22 17:42 pci-0000:00:02.0-card -> ../card0
lrwxrwxrwx 1 root root  8 Oct 22 17:42 pci-0000:01:00.0-card -> ../card1
lrwxrwxrwx 1 root root 12 Oct 22 17:42 pci-0000:00:02.0-render -> ../renderD128
lrwxrwxrwx 1 root root 12 Oct 22 17:42 pci-0000:01:00.0-render -> ../renderD129
```

---

### 4. Create Persistent GPU Symlinks (udev Rules)

To ensure consistent GPU device paths across boots, create static symlinks with this helper script:

> **`scripts/setup-multigpu-udev`**

Usage:

```bash
chmod +x scripts/setup-multigpu-udev
sudo ./scripts/setup-multigpu-udev
```

---

### 5. Verify New Symlinks

After running the script, check:

```bash
ls -l /dev/dri/
```

Expected output:

```
igpu -> card0
nvidia-gpu -> card1
```

---

### 6. Tell Hyprland Which GPU to Use

In your `~/.config/hypr/environment.conf`, set the GPU priority:

```conf
env = AQ_DRM_DEVICES, /dev/dri/nvidia-gpu:/dev/dri/igpu
```

This makes **NVIDIA** the primary rendering device, with **Intel** available as a fallback.

---

## 🧹 Cleanup (Optional)

To remove all created udev rules and symlinks:

> **`scripts/remove-multigpu-udev`**

Usage:

```bash
chmod +x scripts/remove-multigpu-udev
sudo ./scripts/remove-multigpu-udev
```

---

## 📄 References

* [Hyprland Wiki – Multi-GPU Configuration](https://wiki.hypr.land/Configuring/Multi-GPU/)
* [Hyprland Wiki – NVIDIA](https://wiki.hypr.land/Nvidia/).
