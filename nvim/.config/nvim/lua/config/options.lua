local opt = vim.opt

vim.g.mapleader = " "

opt.number = true
opt.cursorline = true
opt.wrap = false
opt.termguicolors = true

-- Tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Use system clipboard as default register
opt.clipboard:append("unnamedplus")

-- Turn off swapfile
opt.swapfile = false
