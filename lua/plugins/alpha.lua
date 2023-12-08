local ok, alpha = pcall(require, 'alpha')
if not ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>", {}),
    dashboard.button( "SPC f f", "󰮗  > Find file", ":Telescope find_files<CR>", {}),
    dashboard.button( "SPC f o", "  > Recent"   , ":Telescope oldfiles<CR>", {}),
    dashboard.button( "SPC s s", "  > Session"   , ":SearchSession<CR>", {}),
    dashboard.button( "SPC o c", "  > open config",  '<cmd>cd ~/.config/nvim/<cr> <cmd>SessionRestore<cr>', {}),
    dashboard.button( "q", "󰩈 > Quit NVIM", ":qa<CR>", {}),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
