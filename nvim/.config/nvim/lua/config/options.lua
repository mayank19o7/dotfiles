-- =====================================================
-- Options
-- =====================================================

local opt = vim.opt

-- -----------------------------------------------------
-- UI
-- -----------------------------------------------------
opt.winborder = "rounded" -- Global floating window border
opt.number = true -- Absolute line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true -- Highlight current line
opt.showmode = false -- Mode shown in status line instead
opt.linebreak = true -- Wrap lines at word boundaries
opt.list = true -- Show invisible characters
opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}

-- -----------------------------------------------------
-- Mouse & Clipboard
-- -----------------------------------------------------
opt.mouse = "a" -- Enable mouse support
opt.clipboard:append("unnamedplus") -- Use system clipboard

-- -----------------------------------------------------
-- Indentation & Tabs
-- -----------------------------------------------------
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- -----------------------------------------------------
-- Search
-- -----------------------------------------------------
opt.ignorecase = true -- Case-insensitive search
opt.smartcase = true -- Override ignore case if uppercase used

-- -----------------------------------------------------
-- Splits & Window Behavior
-- -----------------------------------------------------
opt.splitright = true -- Vertical splits open to the right
opt.splitbelow = true -- Horizontal splits open below
opt.inccommand = "split" -- Live preview for substitutions
opt.confirm = true -- Confirm before closing unsaved buffers

-- -----------------------------------------------------
-- Files & Undo
-- -----------------------------------------------------
opt.undofile = true -- Persistent undo history
opt.spell = true -- Enable spell checking

-- -----------------------------------------------------
-- Auto commands
-- -----------------------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- -----------------------------------------------------
-- Diagnostics
-- -----------------------------------------------------
local diagnostic = vim.diagnostic

diagnostic.config({
	severity_sort = true,
	virtual_text = true,
	float = {
		border = "rounded",
		source = "if_many",
	},
	signs = {
		text = {
			[diagnostic.severity.ERROR] = "󰅚 ",
			[diagnostic.severity.WARN] = "󰀪 ",
			[diagnostic.severity.INFO] = "󰋽 ",
			[diagnostic.severity.HINT] = "󰌶 ",
		},
	},
})
