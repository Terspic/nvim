local function nord_setup()
	vim.g.nord_italic = true
	vim.g.nord_borders = true
	vim.g.nord_contrast = true
	vim.g.nord_enable_sidebar_background = true
	vim.g.nord_disable_background = false
	vim.cmd [[ colorscheme nord ]]
end

local function kanagawa_setup()
	vim.cmd [[ colorscheme kanagawa ]]
end

local kanagawa_colors = require("kanagawa.colors").setup()
local nord_colors = require("nord.colors")

local themes = {
	nord = {
		setup = nord_setup,
		lualine_colors = {
			bg = nord_colors.nord0_gui,
			fg = nord_colors.nord4_gui,
			darkblue = nord_colors.nord10_gui,
			blue = nord_colors.nord9_gui,
			lightblue = nord_colors.nord8_gui,
			turquoise = nord_colors.nord7_gui,
			green = nord_colors.nord14_gui,
			violet = nord_colors.nord15_gui,
			yellow = nord_colors.nord13_gui,
			red  = nord_colors.nord11_gui,
			orange  = nord_colors.nord12_gui,
		}
	},
	kanagawa = {
		setup = kanagawa_setup,
		lualine_colors = {
			bg = kanagawa_colors.sumiInk1,
			fg = kanagawa_colors.fujiWhite,
			darkblue = kanagawa_colors.dragonBlue,
			blue = kanagawa_colors.crystalBlue,
			lightblue = kanagawa_colors.springBlue,
			turquoise = kanagawa_colors.waveAqua2,
			green = kanagawa_colors.autumnGreen,
			violet = kanagawa_colors.oniViolet,
			yellow = kanagawa_colors.autumnYellow,
			red  = kanagawa_colors.samuraiRed,
			orange  = kanagawa_colors.roninYellow,
		}
	},
}

return themes
