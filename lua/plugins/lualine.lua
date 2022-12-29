local ok, lualine = pcall(require, 'lualine')
if not ok then
	return
end

local colors = require('theme').kanagawa.lualine_colors

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
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = { 'toggleterm', 'quickfix' }
}

local conditions =  {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

ins_left {
	function ()
		return '▊'
	end,
	color = { fg = colors.blue },
	padding = { left = 0, right = 1 }
}

ins_left {
	function ()
		return ''
	end,
	color = function()
		local mode_color = {
			n = colors.green,
			i = colors.lightblue,
			v = colors.turquoise,
			[''] = colors.turquoise,
			V = colors.turquoise,
			c = colors.orange,
			ce = colors.green,
			cv = colors.green,
			no = colors.green,
			s = colors.violet,
			S = colors.violet,
			r = colors.yellow,
			rm = colors.yellow,
			R = colors.yellow,
			Rv = colors.yellow,
			['r?'] = colors.yellow,
			['!'] = colors.turquoise,
			t = colors.blue
		}
		return { fg = mode_color[vim.fn.mode()] }
	end,
	padding = { right = 1 },
}

ins_left {
	'filesize',
	condition = conditions.buffer_not_empty,
	padding = { left = 1, right = 2 }
}

ins_left {
	'filetype',
	colored = true,
	icon_only = true,
	padding = { right = 0 }
}

ins_left {
	'filename',
	condition = conditions.buffer_not_empty,
	path = 1,
	shorting_target = 30,
	color = { gui = 'bold' }
}

ins_left {
	'diagnostics',
	source = { 'nvim_diagnostics' },
	symbols = { error = ' ', warn = ' ', info = ' ' },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.dragonBlue },
	},
	color = { gui = "bold", bg = colors.bg },
	on_click = function()
		vim.cmd("TroubleToggle")
	end
}

ins_right {
	'o:encoding',
	color = { gui = "bold" }
}

ins_right {
	function ()
		return '|'
	end
}

ins_right {
	'fileformat',
	fmt = string.upper,
	icons_enabled = false,
	color = { gui = "bold" }
}

ins_right {
	function ()
		return '|'
	end
}

ins_right {
	'location',
	color = { gui = "bold" }
}

ins_right {
	'diff',
	diff_color = {
		added = { fg = colors.green },
		modified = { fg = colors.yellow },
		removed = { fg = colors.red },
	},
	color = { gui = "bold", bg = colors.bg },
}

ins_right {
	'branch',
	icon = '',
	color = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
	padding = { left = 1, right = 0 },
}


ins_right {
	function ()
		return '▊'
	end,
	color = { fg = colors.blue },
	padding = { left = 0, right = 0 }
}

lualine.setup(config)
