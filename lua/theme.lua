vim.opt.syntax = "on"
vim.o.background = "dark"

local function nord_setup()
	vim.g.nord_italic = true
	vim.g.nord_borders = true
	vim.g.nord_contrast = true
	vim.g.nord_enable_sidebar_background = true
	vim.g.nord_disable_background = false
	vim.cmd [[ colorscheme nord ]]
end

local themes = {
	nord = nord_setup,
}

-- select themes
themes.nord()
