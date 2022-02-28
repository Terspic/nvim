""" ===========
"""   Plugins
""" ===========
call plug#begin()
"" LSP Plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'neovim/nvim-lspconfig'
" completions plugins
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
" snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" Debug
Plug 'mfussenegger/nvim-dap'

"" UI Plugins
Plug 'nvim-lualine/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'
Plug 'seblj/nvim-tabline'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'tmsvg/pear-tree'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'sindrets/winshift.nvim'
Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'

"" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

"" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"" Languages
Plug 'Shatur/neovim-cmake'
Plug 'sheerun/vim-polyglot'
Plug 'tikhomirov/vim-glsl'
Plug 'DingDean/wgsl.vim'
Plug 'rust-lang/rust.vim'
Plug 'saecki/crates.nvim'
Plug 'fladson/vim-kitty'

"" Themes and icons
Plug 'arcticicestudio/nord-vim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()


""" =========================
"""   General Configuration
""" =========================
syntax enable
filetype plugin indent on

set number
set autoindent
set smartindent
set noshowmode
set visualbell
set wrap
set cursorline
set mouse=a
set termguicolors
set tabstop=4
set shiftwidth=4
set softtabstop=4
set updatetime=100
set encoding=utf-8
set splitbelow splitright
set nobackup nowritebackup
let mapleader = "ù"


""" ======================
"""   Nord Configuration
""" ======================
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comment = 1
colorscheme nord

" make resize more friendly
noremap <silent> <c-Left> <cmd>vertical resize -3<cr>
noremap <silent> <c-Right> <cmd>vertical resize +3<cr>
noremap <silent> <c-Up> <cmd>resize +3<cr>
noremap <silent> <c-Down> <cmd>resize -3<cr>

" open new terminal
nnoremap <leader>t <cmd>split <cr> <cmd>term <cr> <cmd>startinsert <cr>

" shortcuts for opening and reloading config
nnoremap <leader>r <cmd>source ~/.config/nvim/init.vim<cr>
nnoremap <leader>k <cmd>tabnew ~/.config/nvim/init.vim<cr>

" remove all White Space before save
function! Trim()
	keeppatterns %s/\s\+$//e
endfun
nnoremap <leader>w <cmd>call Trim()<cr>

" open url
nnoremap <silent><leader>u <cmd>!xdg-open "<cword>"<cr><cr>


""" =====================
"""   LSP Configuration
""" =====================
lua require('lspconf')
"" Mappings
nnoremap <silent><leader>cr <cmd>Telescope lsp_references initial_mode=normal<cr>
nnoremap <silent><leader>cgd <cmd>Telescope lsp_definitions initial_mode=normal<cr>
nnoremap <silent><leader>cgt <cmd>Telescope lsp_type_definitions initial_mode=normal<cr>
nnoremap <silent><leader>cgi <cmd>Telescope lsp_implementations initial_mode=normal<cr>
nnoremap <silent><leader>csw <cmd>Telescope lsp_workspace_symbols initial_mode=normal<cr>
nnoremap <silent><leader>csd <cmd>Telescope lsp_document_symbols initial_mode=normal<cr>
nnoremap <silent><leader>cdd <cmd>Telescope diagnostics initial_mode=normal<cr>
nnoremap <silent><leader>cdp <cmd>lua vim.diagnostic.goto_prev()<cr>
nnoremap <silent><leader>cdn <cmd>lua vim.diagnostic.goto_next()<cr>
nnoremap <silent><leader>ca <cmd>Telescope lsp_code_actions theme=cursor initial_mode=normal<cr>
nnoremap <silent><F2> <cmd>lua require("lsp_ui").rename()<cr>
nnoremap <silent><leader>ch <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent><leader>cf <cmd>lua vim.lsp.buf.formatting()<cr>


""" ======================
"""   Rust configuration
""" ======================
let g:rustfmt_autosave = 1
" crate setup
lua require('crates').setup()


""" ==========================
"""   NvimTree Configuration
""" ==========================
let g:nvim_tree_git_hl = 0
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
let g:nvim_tree_special_files = {}
let g:nvim_tree_icons = {
    \ 'git': {
    \   'unstaged': "",
    \   'staged': "",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
   \ }
lua << EOF
require('nvim-tree').setup{
	disable_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	auto_close = true,
	update_cwd = true,
	git = {
		enable = true,
		ignore = false,
	},
	filters = {
		dotfiles = true,
		custom = { ".git" },
	},
	view = {
		auto_resize = true,
		mappings = {
			list = {
				{ key = "t", action = "tabnew" },
			}
		}
	},
}
EOF
nnoremap <leader>no <cmd>NvimTreeOpen<cr>
nnoremap <leader>nt <cmd>NvimTreeToggle<cr>
nnoremap <leader>nff <cmd>NvimTreeFindFile<cr>
nnoremap <leader>nf <cmd>NvimTreeFocus<cr>


""" =========================
"""   Tabline Configuration
""" =========================
lua << EOF
require('tabline').setup({
	always_show_tabs = true,
	separator = "",
})
EOF


""" =========================
"""   LuaLine Configuration
""" =========================
lua << EOF
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { 'NvimTree' },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename', 'lsp_progress' },
		lualine_x = {},
		lualine_y = { 'filetype', 'encoding', 'progress', 'location',},
		lualine_z = { 'os.date("%H:%M")' }
	},
	inactive_sections = {
		lualine_a = {'filename'},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = { 'fugitive' }
}
EOF


""" ===========================
"""   Pear Tree Configuration
""" ===========================
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspaces = 1


""" ===========================
"""   Telescope Configuration
""" ===========================
lua << EOF
require('telescope').setup({
	defaults = {
		mappings = {
			n = {
				["t"] = require("telescope.actions").select_tab,
			},
		},
	},
})
require('telescope').load_extension("ui-select")
require('telescope').load_extension('dap')
require('telescope').load_extension('session-lens')
EOF
nnoremap <silent><leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent><leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent><leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent><leader>fh <cmd>Telescope help_tags<cr>

""" =====================
"""   Dap Configuration
""" =====================
lua << EOF
local dap = require('dap')
dap.adapters.lldb = {
	type = "executable",
	command = "lldb-vscode",
	name ="lldb",
}
dap.configurations.rust = {
	{
		name = "Launch",
    	type = "lldb",
    	request = "launch",
    	program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    	end,
    	cwd = '${workspaceFolder}',
    	stopOnEntry = false,
    	args = {},
	}
}
dap.configurations.cpp = {
	{
		name = "Launch",
    	type = "lldb",
    	request = "launch",
    	program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
    	end,
    	cwd = '${workspaceFolder}',
    	stopOnEntry = false,
    	args = {},
	}
}
dap.configurations.c = dap.configurations.cpp
EOF
nnoremap <silent><F5> <cmd>lua require'dap'.continue()<CR>
nnoremap <silent><F10> <cmd>lua require'dap'.step_over()<CR>
nnoremap <silent><F11> <cmd>lua require'dap'.step_into()<CR>
nnoremap <silent><F12> <cmd>lua require'dap'.step_out()<CR>
nnoremap <silent><leader>b <cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent><leader>B <cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent><leader>lp <cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent><leader>dr <cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent><leader>dl <cmd>lua require'dap'.run_last()<CR>


""" ==========================
"""   GitSigns Configuration
""" ==========================
lua << EOF
require('gitsigns').setup({})
EOF


""" ==============================
"""   Auto-session Configuration
""" ==============================
lua << EOF
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require('auto-session').setup({
	log_level = 'info',
	auto_session_suppress_dirs = { '~/' },
})
require('session-lens').setup {
	previewer = false,
	prompt_title = 'SESSIONS'
}
EOF
nnoremap <silent><leader>ss <cmd>SearchSession<cr>


""" ==========================
"""   WinShift Configuration
""" ==========================
lua << EOF
require('winshift').setup({
	highlight_moving_win = true,
	window_picker_ignore = {
		filetype = {
			"NvimTree"
		},
	},
})
EOF
nnoremap <silent><leader>wu <cmd>WinShift up<cr>
nnoremap <silent><leader>wd <cmd>WinShift down<cr>
nnoremap <silent><leader>wl <cmd>WinShift left<cr>
nnoremap <silent><leader>wr <cmd>WinShift right<cr>
nnoremap <silent><leader>wuu <cmd>WinShift far_up<cr>
nnoremap <silent><leader>wdd <cmd>WinShift far_down<cr>
nnoremap <silent><leader>wll <cmd>WinShift far_left<cr>
nnoremap <silent><leader>wrr <cmd>WinShift far_right<cr>
nnoremap <silent><leader>ws <cmd>WinShift swap<cr>
