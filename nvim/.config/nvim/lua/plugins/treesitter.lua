return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				max_lines = 4,
				multiline_threshold = 2,
			},
		},
	},
	lazy = false,
	priority = 900,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		-- Dedicated augroup to avoid duplicate autocmds on reload
		local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })

		---------------------------------------------------------------------
		-- Helper: safely enable Treesitter for a given buffer + language
		---------------------------------------------------------------------
		local function enable_treesitter(buf, lang)
			-- Guard against invalid buffers
			if not vim.api.nvim_buf_is_valid(buf) then
				return
			end

			-- pcall prevents hard errors if a parser is missing or fails
			local ok = pcall(vim.treesitter.start, buf, lang)
			if ok then
				-- Use Treesitter-powered indentation
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

				-- NOTE:
				-- Folding via Treesitter is intentionally commented out.
				-- Uncomment if you want Treesitter-based folding globally.
				--
				-- for _, win in ipairs(vim.api.nvim_list_wins()) do
				--	if vim.api.nvim_win_get_buf(win) == buf and vim.api.nvim_win_is_valid(win) then
				--		vim.wo[win].foldmethod = "expr"
				--		vim.wo[win].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				--	end
				-- end
			end
		end

		---------------------------------------------------------------------
		-- Install core parsers once lazy.nvim finishes loading
		---------------------------------------------------------------------
		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = "LazyDone",
			once = true,
			desc = "Install core treesitter parsers",
			callback = function()
				treesitter.install({
					"bash",
					"comment",
					"css",
					"html",
					"java",
					"javascript",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"regex",
					"toml",
					"typescript",
					"xml",
					"yaml",
				}, { max_jobs = 8 })
			end,
		})
		---------------------------------------------------------------------
		-- Filetypes where Treesitter should never be enabled
		---------------------------------------------------------------------
		local ignore_filetypes = {
			checkhealth = true,
			lazy = true,
			mason = true,
			notify = true,
			noice = true,
			qf = true,
			toggleterm = true,
		}

		---------------------------------------------------------------------
		-- Enable Treesitter per buffer on FileType event
		---------------------------------------------------------------------
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			desc = "Enable treesitter highlighting and indentation",
			callback = function(event)
				-- Skip utility/UI buffers
				if ignore_filetypes[event.match] then
					return
				end

				-- Avoid performance issues on large files
				local filename = vim.api.nvim_buf_get_name(event.buf)
				local stats = vim.uv.fs_stat(filename)
				if vim.api.nvim_buf_line_count(event.buf) > 5000 or (stats and stats.size > 100 * 1024) then
					return
				end

				local lang = vim.treesitter.language.get_lang(event.match) or event.match
				enable_treesitter(event.buf, lang)
			end,
		})
	end,
}
