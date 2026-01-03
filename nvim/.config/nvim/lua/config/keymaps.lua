-- =====================================================
-- Key maps
-- =====================================================

local map = vim.keymap.set
local Snacks = require("snacks")

-- -----------------------------------------------------
-- General
-- -----------------------------------------------------

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
-- Window navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move to left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move to right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move to upper window" })
-- Color schemes
map("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })

-- -----------------------------------------------------
-- Terminal
-- -----------------------------------------------------
map({ "n", "t" }, "<C-/>", function() Snacks.terminal() end, { desc = "Toggle terminal" })
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- -----------------------------------------------------
-- File Explorer
-- -----------------------------------------------------
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "[E]xplorer" })

-- -----------------------------------------------------
-- Picker / Finder
-- -----------------------------------------------------
map("n", "<leader><space>", function() Snacks.picker.buffers() end, { desc = "Find buffers" })
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "[F]ind [F]iles" })
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "[F]ind [C]onfig files" })
map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "[F]iles [G]rep" })
map("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "[F]iles [K]eymaps" })
map("n", "<leader>fp", function() Snacks.picker.pickers() end, { desc = "[F]ind [P]ickers" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "[F]ind [R]ecent files" })
map("n", "<leader>fs", function() Snacks.picker.smart() end, { desc = "[F]ind files [S]mart" })

-- -----------------------------------------------------
-- Git
-- -----------------------------------------------------
map("n", "lg", function() Snacks.lazygit() end, { desc = "[L]azy[G]it" })
map("n", "gs", function() Snacks.picker.git_status() end, { desc = "[G]it [S]tatus" })
map("n", "gd", function() Snacks.picker.git_diff() end, { desc = "[G]it [D]iff (hunks)" })
map("n", "gl", function() Snacks.picker.git_log() end, { desc = "[G]it [L]og" })
map("n", "gL", function() Snacks.picker.git_log_line() end, { desc = "[G]it log [L]ine" })
map("n", "gS", function() Snacks.picker.git_stash() end, { desc = "[G]it [S]tash" })
map("n", "gf", function() Snacks.picker.git_log_file() end, { desc = "[G]it [F]ile log" })
map("n", "ga",
	function()
		vim.fn.system({ "git", "add", vim.fn.expand("%") })
		Snacks.notifier.notify(" Added " .. vim.fn.expand("%:t") .. " to Git", "info", {})
	end,
	{ desc = "Git add current file" }
)

-- ----------------------------------------------------------------------------
-- Scratch / Misc
-- ----------------------------------------------------------------------------
map("n", "<leader>.", function() Snacks.scratch() end, { desc = "Toggle scratch buffer" })
map("n", "<leader>S", function() Snacks.scratch.select() end, { desc = "Select scratch buffer" })

-- ----------------------------------------------------------------------------
-- LSP (global pickers)
-- ----------------------------------------------------------------------------
map("n", "<leader>gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto definition" })
map("n", "<leader>gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto declaration" })
map("n", "<leader>gr", function() Snacks.picker.lsp_references() end, { desc = "References" })
map("n", "<leader>gi", function() Snacks.picker.lsp_implementations() end, { desc = "Goto implementation" })
map("n", "<leader>gt", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto type definition" })
map("n", "<leader>d", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer diagnostics" })

-- ----------------------------------------------------------------------------
-- LSP (buffer-local on attach)
-- ----------------------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
	callback = function(event)
		local bufmap = function(mode, lhs, rhs, desc)
			map(mode, lhs, rhs, { buffer = event.buf, desc = desc })
		end

		bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code actions")
		bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")

		bufmap("n", "<leader>f", function()
			Snacks.notifier.notify("󰉣 Formatting buffer", "info", {})
			vim.lsp.buf.format({ async = true })
		end, "Format buffer")
	end,
})
