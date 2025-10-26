-- --------------------------------------------------------
-- General
-- --------------------------------------------------------
local opt = vim.opt

-- Set leader key to space
vim.g.mapleader = " "

-- Number of spaces a tab represents
opt.tabstop = 4
opt.softtabstop = 4

-- Indentation
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true

-- Disable wrap
opt.wrap = false

-- Use system clipboard as default register
opt.clipboard:append("unnamedplus")

-- Turn off swapfile
opt.swapfile = false

-- --------------------------------------------------------
-- Search
-- --------------------------------------------------------

-- Ignore case for search
opt.ignorecase = true
opt.smartcase = true

-- --------------------------------------------------------
-- UI
-- --------------------------------------------------------

-- Sets a global border style for all floating windows
opt.winborder = "rounded"

-- Enable line numbers
opt.number = true

-- Enable relative line numbers
opt.relativenumber = true

-- Enable cursor line highlight
opt.cursorline = true

-- Enable 24-bit color
opt.termguicolors = true

-- Diagnostics
local severity = vim.diagnostic.severity

vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})
