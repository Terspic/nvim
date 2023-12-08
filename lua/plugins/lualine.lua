local ok, lualine = pcall(require, 'lualine')
if not ok then
	return
end

local config = {
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = 'kanagawa',
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			'tabs',
			{
				'buffers',
				symbols = {
					alternate_file = '',
				},
				buffers_color = {
					active = 'lualine_a_normal',
					inactive = 'lualine_a_inactive',
				},
			}
		},
		lualine_b = {
			'diagnostics'
		},
		lualine_c = {
		},
		lualine_x = {'encoding', 'location'},
		lualine_y = {'diff'},
		lualine_z = {{'branch', color = {gui = 'bold'}}},
	},
	extensions = { 'toggleterm', 'quickfix' }
}

lualine.setup(config)
