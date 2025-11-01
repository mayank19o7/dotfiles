local map = vim.keymap.set
local Snacks = require("snacks")

-- File Explorer
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })

-- Picker / Finder
map("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Grep files" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find config files" })
map("n", "<leader>gf", function() Snacks.picker.git_files() end, { desc = "Find git files" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent files" })

-- Git
map("n", "lg", function() Snacks.lazygit() end, { desc = "Lazygit" })
map("n", "gl", function() Snacks.picker.git_log() end, { desc = "Git log" })
map("n", "gL", function() Snacks.picker.git_log_line() end, { desc = "Git log line" })
map("n", "gs", function() Snacks.picker.git_status() end, { desc = "Git status" })
map("n", "gS", function() Snacks.picker.git_stash() end, { desc = "Git stash" })
map("n", "gd", function() Snacks.picker.git_diff() end, { desc = "Git diff (Hunks)" })
map("n", "gf", function() Snacks.picker.git_log_file() end, { desc = "Git log file" })
map("n", "ga",
	function()
		vim.fn.system({ "git", "add", vim.fn.expand("%") })
		Snacks.notifier.notify("📦 Added " .. vim.fn.expand("%:t") .. " to Git", "info", {})
	end,
	{ desc = "Git add current file" }
)

-- Misc
map("n", "<leader>.", function() Snacks.scratch() end, { desc = "Toggle scratch buffer" })
map("n", "<leader>S", function() Snacks.scratch.select() end, { desc = "Select scratch buffer" })

-- LSP
map("n", "<leader>gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto definition" })
map("n", "<leader>gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto declaration" })
map("n", "<leader>gr", function() Snacks.picker.lsp_references() end, { desc = "References" })
map("n", "<leader>gi", function() Snacks.picker.lsp_implementations() end, { desc = "Goto implementation" })
map("n", "<leader>gt", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto type definition" })
map("n", "<leader>d", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer diagnostics" })

-- LSP-specific keymaps (set only when an LSP attaches)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspKeymaps", { clear = true }),
	callback = function(event)
		local bufferMap = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
		end

		-- LSP actions
		bufferMap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Actions")
		bufferMap("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")

		-- Format with notifier
		bufferMap("n", "<leader>f", function()
			Snacks.notifier.notify("💯 Formatting buffer !!!", "info", {})
			vim.lsp.buf.format({ async = true, })
		end, "Format buffer")
	end,
})
