return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"cssls",
			"eslint",
			"jsonls",
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
		{
			"neovim/nvim-lspconfig",
		}
	}
}
