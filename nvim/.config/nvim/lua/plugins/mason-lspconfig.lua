return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"cssls",
				"eslint",
				"jsonls",
				"html",
				"lua_ls",
				"ts_ls",
			},
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						border = "rounded",
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettierd",
				"stylua",
			},
		},
		dependencies = { "mason-org/mason.nvim" },
	},
}
