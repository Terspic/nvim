require('lualine').setup {
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = 'nord',
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = {},
		lualine_y = { 'filetype', 'encoding', 'location', },
		lualine_z = { 'os.date("%H:%M")' }
	},
	inactive_sections = {
		lualine_a = { 'filename' },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = { 'fugitive', 'toggleterm', 'quickfix' }
}
