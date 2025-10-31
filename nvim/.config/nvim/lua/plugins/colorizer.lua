return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = {
		filetypes = { "*" }, -- Apply to all filetypes
		user_default_options = {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = false, -- Disable color names like 'Blue'
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			AARRGGBB = true, -- 0xAARRGGBB format
			rgb_fn = true, -- CSS rgb() and rgba()
			hsl_fn = true, -- CSS hsl() and hsla()
			css = true, -- Enable all CSS features
			css_fn = true, -- Enable CSS functions
			mode = "background", -- Display mode: foreground, background, virtualtext
			tailwind = true, -- Enable tailwind colors (auto-detects class names)
			always_update = true,
		},
	},
}
