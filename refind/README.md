# rEFInd — Theme Installation & Disabling Text Mode

This guide walks you through installing and enabling a custom theme for the **rEFInd boot manager**, as well as disabling text mode for a graphical boot menu.

---

## 🧭 Installation Steps

### 1. Locate the rEFInd Directory

rEFInd is typically installed in one of the following paths:

* `/boot/efi/EFI/refind`
* `/boot/EFI/refind`

---

### 2. Create a `themes` Folder

If a `themes` folder does not exist, create one inside the rEFInd directory:

```bash
sudo mkdir -p /boot/EFI/refind/themes
```

---

### 3. Copy Theme Files

1. Download or clone your desired rEFInd theme repository.

2. Extract the downloaded archive (if applicable):

   ```bash
   tar -xvf <theme-name>.tar.gz
   ```

3. Copy the extracted theme folder into the `themes` directory:

   ```bash
   sudo cp -r theme-folder /boot/EFI/refind/themes/
   ```

---

### 4. Modify `refind.conf`

#### Enable the Theme

Open the main configuration file:

```bash
sudo micro /boot/EFI/refind/refind.conf
```

Add the following line at the end of the file, replacing folder and file names as necessary:

```
include themes/theme-folder-name/theme.conf
```

#### Disable Text Mode

To use graphical mode instead of text, locate and modify the following line in `refind.conf`:

```conf
use_graphics_for windows,linux
```

> 💡 *Alternatively, you can replace your existing `refind.conf` with the version provided in this dotfile repository.*

---

### 5. Save & Reboot

Save your changes, then reboot the system.
The new theme should now appear on the rEFInd boot screen.

---

## 📝 Notes

* Ensure the **theme folder** and `.conf` file names match exactly.
* Remove or comment out other `include` lines for themes to prevent conflicts.
* If the theme does not load, verify you edited the correct `refind.conf` file used by your active rEFInd installation.
* Some themes may require additional setup — check the theme’s documentation for details.
