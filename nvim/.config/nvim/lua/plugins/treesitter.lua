return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			indent = { enable = true },
			highlight = { enable = true },
			folds = { enable = true },
			ensure_installed = {
				"bash",
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"toml",
				"typescript",
			},
		})
	end,
}
