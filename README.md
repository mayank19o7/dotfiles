# my-dotfiles

This repository contains my personal configuration files (dotfiles) to set up my development and working environment across various systems. It includes configurations for shell, editor, window manager, and other tools.

## Contents

- **Shell:** Configuration files for Zsh/Bash (e.g., `.zshrc`, `.bashrc`)
- **Editor:** Custom settings and plugins for Vim, Micro, or other editor
- **Window Manager:** Config files for Hyprland
- **Git:** Git configuration and aliases
- **Other tools:** Config files for alacritty, kitty etc.

## Features

- Quick system setup by linking or copying config files
- Modular and easy to customize
- Consistent environment across multiple machines

## Installation

Clone the repository:

```bash
git clone https://github.com/mayank19o7/my-dotfiles.git ~/Dotfiles
```
link files using stow

```bash
stow zsh
```

Or manually copy files or extract themes (for rEFInd and sddm):

```bash
tar -xvf <theme-name>.tar.gz

cp <source_dir> <dest_dir>
```

## Usage

- Customization can be done by editing the respective config files in the repository.
