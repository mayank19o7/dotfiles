return {
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000,
		opts = { transparent = true },
		config = function(_, opts)
			require("vague").setup(opts)
			vim.cmd.colorscheme("vague")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true, -- not loaded until chosen
		opts = {
			transparent_background = true,
			float = {
				transparent = true,
				solid = true,
			}
		},
	},
}
