return {
	"folke/snacks.nvim",
	dependencies = {
		"nvim-mini/mini.icons",
		"nvim-tree/nvim-web-devicons"
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
		explorer = { enabled = true },
		image = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		lazygit = { enabled = true },
		notifier = { enabled = true },
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
	    quickfile = { enabled = true },
		scroll = { enabled = false },
		scratch = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = { enabled = true },
		words = { enabled = true },
	},
}
