# SDDM Theme Installation Guide

This README explains how to install, configure, and customize an SDDM (Simple Desktop Display Manager) theme.

## Prerequisites

- SDDM must be installed and enabled as the system display manager.
- Administrative/root privileges are required for theme installation and configuration.

## Download and Extract Theme

1. Find and download a desired SDDM theme. Popular sources include KDE Store and Pling.
2. Extract the theme archive:
   ```
   tar -xvf sugar-candy.tar.gz
   ```
   Or use a GUI file manager to extract it.

## Install Theme

1. Move the extracted theme folder to the correct SDDM theme directory:
   ```
   sudo mv theme-folder /usr/share/sddm/themes/
   ```
   The theme folder name should match the theme’s internal name.

## Configure SDDM

1. Open the SDDM configuration file for editing:
   - System-wide config: `/etc/sddm.conf`
   - Alternatively: Create or edit `/etc/sddm.conf.d/theme.conf.user` for per-user override.
2. Set the theme name:
   ```
   [Theme]
   Current=theme-folder-name
   ```
   Save and close the file.

## Restart SDDM

1. To apply changes, restart SDDM:
   ```
   sudo systemctl restart sddm
   ```
   Or simply reboot the system.
2. The login screen should display the new theme.

## Customization

- To change the theme background, edit `theme.conf` or add a file like `theme.conf.user` in the theme directory. Specify the path to the preferred background image.
- Additional theme options (such as time format, blur, colors, etc.) can also be edited in the respective configuration files.

## Preview Theme (Optional)

- To preview a theme without logging out:
  ```
  sddm-greeter --test-mode --theme /usr/share/sddm/themes/theme-folder-name
  ```
  This shows a preview of how the theme looks.

## Troubleshooting

- Ensure dependencies (e.g., qt5-quickcontrols2, qt5-graphicaleffects and qt5-qtsvg) are installed for certain themes.
- Verify the theme folder name in `/usr/share/sddm/themes/` matches the name in the configuration file.
