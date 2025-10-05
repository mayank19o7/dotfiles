# rEFInd Theme Installation

This guide explains how to install and apply a custom theme for the rEFInd boot manager.

## Installation Steps

1. **Locate rEFInd directory**
   - Usually found at `/boot/efi/EFI/refind` or `/boot/EFI/refind`.

2. **Create themes folder**
   - Inside the rEFInd directory, create a folder named `themes` if it does not exist.

   ```bash
   sudo mkdir -p /boot/EFI/refind/themes
   ```

3. **Copy theme files**
   - Download or clone the theme repository.
   - Extract the theme from tar.gz using below command.
   
   ```bash
   tar -xvf <theme-name>.tar.gz
   ```
   - Copy the entire theme folder into the `themes` directory.

   ```bash
   sudo cp -r theme-folder /boot/EFI/refind/themes/
   ```

4. **Enable the theme**
   - Open the `refind.conf` file in the rEFInd directory.

   ```bash   
   sudo micro /boot/EFI/refind/refind.conf
   ```

   - Add the following line at the end, adjusting the theme folder and `.conf` file name as needed:

   ```
   include themes/theme-folder-name/theme.conf
   ```

5. **Save changes and reboot**
   - Save the configuration file and reboot the system.
   - The selected theme should appear on the rEFInd boot screen.

## Notes

- Ensure the theme folder and `.conf` file names match exactly.
- Delete or comment out any other theme includes in `refind.conf` to avoid conflicts.
- If the theme does not apply, verify you are editing the active rEFInd installation's `refind.conf`.
- Some themes may require additional setup; refer to the theme's documentation if available.
