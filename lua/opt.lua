vim.opt.number = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showmode = false
vim.opt.visualbell = true
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.updatetime = 100
vim.opt.encoding = "utf-8"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false

-- Globals
vim.g.rustfmt_autosave = true

-- Others
vim.cmd [[
nnoremap <space> <Nop>
let mapleader = " "

noremap <silent> <c-Left> <cmd>vertical resize -3<cr>
noremap <silent> <c-Right> <cmd>vertical resize +3<cr>
noremap <silent> <c-Up> <cmd>resize +3<cr>
noremap <silent> <c-Down> <cmd>resize -3<cr>

function! Trim()
	keeppatterns %s/\s\+$//e
endfun
nnoremap <leader>w <cmd>call Trim()<cr>
]]
