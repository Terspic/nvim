vim.g.nord_italic = true
vim.g.nord_borders = true
vim.g.nord_contrast = true
vim.g.nord_enable_sidebar_background = true
vim.g.nord_disable_background = false

require("kanagawa").setup({
	compile = true,
	keywordStyle = { italic = true, bold = true },

	overrides = function (colors)
    local theme = colors.theme
		return {
			TelescopeTitle = { fg = theme.ui.special, bold = true },
			TelescopePromptNormal = { bg = theme.ui.bg_p1 },
			TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
			TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
			TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
			TelescopePreviewNormal = { bg = theme.ui.bg_dim },
			TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
			Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
			PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
			PmenuSbar = { bg = theme.ui.bg_m1 },
			PmenuThumb = { bg = theme.ui.bg_p2 },
		}
	end
})
vim.cmd [[ colorscheme kanagawa ]]

local nord_colors = require("nord.colors")
local kanagawa_colors = require('kanagawa.colors').setup({}).palette

local themes = {
	nord = {
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
