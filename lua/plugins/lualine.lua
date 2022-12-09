local ok, lualine = pcall(require, 'lualine')
if not ok then
	return
end

local colors = require('nord.colors')

local config = {
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = 'nord',
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
	color = { fg = colors.nord9_gui },
	padding = { left = 0, right = 1 }
}

ins_left {
	function ()
		return ''
	end,
	color = function()
		local mode_color = {
			n = colors.nord14_gui,
			i = colors.nord8_gui,
			v = colors.nord7_gui,
			[''] = colors.nord7_gui,
			V = colors.nord7_gui,
			c = colors.nord12_gui,
			ce = colors.nord14_gui,
			cv = colors.nord14_gui,
			no = colors.nord14_gui,
			s = colors.nord15_gui,
			S = colors.nord15_gui,
			r = colors.nord13_gui,
			rm = colors.nord13_gui,
			R = colors.nord13_gui,
			Rv = colors.nord13_gui,
			['r?'] = colors.nord13_gui,
			['!'] = colors.nord7_gui,
			t = colors.nord9_gui
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
		color_error = { fg = colors.nord11_gui },
		color_warn = { fg = colors.nord13_gui },
		color_info = { fg = colors.nord10_gui },
	},
	color = { gui = "bold", bg = colors.nord0_gui },
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
		added = { fg = colors.nord14_gui },
		modified = { fg = colors.nord13_gui },
		removed = { fg = colors.nord11_gui },
	},
	color = { gui = "bold", bg = colors.nord0_gui },
}

ins_right {
	'branch',
	icon = '',
	color = { fg = colors.nord0_gui, bg = colors.nord9_gui, gui = 'bold' },
	padding = { left = 1, right = 0 },
}


ins_right {
	function ()
		return '▊'
	end,
	color = { fg = colors.nord9_gui },
	padding = { left = 0, right = 0 }
}

lualine.setup(config)
