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
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{ "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },

		-- find
		{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<leader>/", function() Snacks.picker.grep() end, desc = "Grep files" },
		{ "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find config files" },
		{ "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find git files" },
		{ "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent files" },

		-- git
		{ "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit" },
		{ "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git log" },
		{ "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git log line" },
		{ "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git status" },
		{ "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git stash" },
		{ "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git diff (Hunks)" },
		{ "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git log file" },

		-- Other
		{ "<leader>.",  function() Snacks.scratch() end, desc = "Toggle scratch buffer" },
		{ "<leader>S",  function() Snacks.scratch.select() end, desc = "Select scratch buffer" },
	},
}
