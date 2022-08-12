vim.opt.syntax = "on"
vim.o.background = "dark"

local function nord_setup()
	vim.g.nord_italic = true
	vim.g.nord_borders = false
	vim.g.nord_contrast = true
	vim.g.nord_enable_sidebar_background = true
	vim.g.nord_disable_background = false
	vim.cmd [[ colorscheme nord ]]
end

local function tokyonight_setup()
	vim.cmd [[ colorscheme tokyonight ]]
end

local function onenord_setup()
	vim.cmd [[ colorscheme onenord ]]
end

local function nordfox_setup()
	vim.cmd [[ colorscheme nordfox ]]
end

local themes = {
	nord = nord_setup,
	tokyonight = tokyonight_setup,
	onenord = onenord_setup,
	nordfox = nordfox_setup
}

-- select themes
themes.nord()
