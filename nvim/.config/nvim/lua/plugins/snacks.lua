return {
	"folke/snacks.nvim",
	dependencies = {
		"echasnovski/mini.icons",
	},
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				header = [[
                                                                     
       ████ ██████           █████      ██                     
      ███████████             █████                             
      █████████ ███████████████████ ███   ███████████   
     █████████  ███    █████████████ █████ ██████████████   
    █████████ ██████████ █████████ █████ █████ ████ █████   
  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
        ]],
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		git = { enabled = true },
		-- show hidden and ignored files on explorer and picker
		picker = {
			enabled = true,
			hidden = true,
			ignored = true,
			sources = {
				files = {
					hidden = true,
					ignored = true,
				}
			}
		},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{ "<leader>e",		function() Snacks.explorer() end, desc = "File Explorer" },

		-- find
		{ "<leader><space>",function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>ff",		function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<leader>fg",		function() Snacks.picker.grep() end, desc = "Grep files" },
		{ "<leader>fb",		function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fc",		function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find config files" },
		{ "<leader>gf",		function() Snacks.picker.git_files() end, desc = "Find git files" },
		{ "<leader>fr",		function() Snacks.picker.recent() end, desc = "Recent files" },

		-- git
		{ "lg",				function() Snacks.lazygit() end, desc = "Lazygit" },
		{ "gl",				function() Snacks.picker.git_log() end, desc = "Git log" },
		{ "gL",				function() Snacks.picker.git_log_line() end, desc = "Git log line" },
		{ "gs",				function() Snacks.picker.git_status() end, desc = "Git status" },
		{ "gS",				function() Snacks.picker.git_stash() end, desc = "Git stash" },
		{ "gd",				function() Snacks.picker.git_diff() end, desc = "Git diff (Hunks)" },
		{ "gf",				function() Snacks.picker.git_log_file() end, desc = "Git log file" },

		-- LSP
		{ "<leader>gd",		function() Snacks.picker.lsp_definitions() end, desc = "Goto definition" },
		{ "<leader>gD",		function() Snacks.picker.lsp_declarations() end, desc = "Goto declaration" },
		{ "<leader>gr",		function() Snacks.picker.lsp_references() end, desc = "References" },
		{ "gi",				function() Snacks.picker.lsp_implementations() end, desc = "Goto [i]mplementation" },
		{ "gt",				function() Snacks.picker.lsp_type_definitions() end, desc = "Goto [t]ype definition" },
		{ "<leader>d",		function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer diagnostics" },
		{ "<leader>ca",		vim.lsp.buf.code_action, desc = "Code actions" },
		{ "<leader>f",		function() Snacks.notifier.notify( " 💯 Format buffer !", "info", {}) vim.lsp.buf.format({async = true}) end, desc = "Format buffer" },

		-- Other
		{ "<leader>.",		function() Snacks.scratch() end, desc = "Toggle scratch buffer" },
		{ "<leader>S",		function() Snacks.scratch.select() end, desc = "Select scratch buffer" },
		{ "<leader>rn",		function() Snacks.rename.rename_file() end, desc = "Rename file" },
	},
}
