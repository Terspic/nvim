lua << EOF
require("plugins")
EOF

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
set noswapfile
nnoremap <space> <Nop>
let mapleader = " "

""" ======================
"""   Nord Configuration
""" ======================
let g:nord_italic = v:true
let g:nord_borders = v:true
colorscheme nord

" make resize more friendly
noremap <silent> <c-Left> <cmd>vertical resize -3<cr>
noremap <silent> <c-Right> <cmd>vertical resize +3<cr>
noremap <silent> <c-Up> <cmd>resize +3<cr>
noremap <silent> <c-Down> <cmd>resize -3<cr>


" open new terminal
nnoremap <leader>t :ToggleTerm direction=horizontal<cr>

" shortcuts for opening and reloading config
nnoremap <leader>r <cmd>source ~/.config/nvim/init.vim<cr>

" remove all White Space before save
function! Trim()
keeppatterns %s/\s\+$//e
endfun
nnoremap <leader>w <cmd>call Trim()<cr>

" open url
nnoremap <silent><leader>u <cmd>!xdg-open "<cword>"<cr><cr>

" toggle quickfix list 
nnoremap <silent><leader>qo <cmd>bo copen<cr>
nnoremap <silent><leader>qq <cmd>cclose<cr>


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
nnoremap <silent><leader>ca <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <silent><F2> <cmd>lua require("lsp_ui").rename()<cr>
nnoremap <silent><leader>ch <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent><leader>cf <cmd>lua vim.lsp.buf.formatting()<cr>


""" ======================
"""   Rust configuration
""" ======================
let g:rustfmt_autosave = 1


""" ==========================
"""   NvimTree Configuration
""" ==========================
nnoremap <silent><leader>no <cmd>NvimTreeOpen<cr>
nnoremap <silent><leader>nc <cmd>NvimTreeClose<cr>
nnoremap <silent><leader>nt <cmd>NvimTreeToggle<cr>
nnoremap <silent><leader>nff <cmd>NvimTreeFindFile<cr>
nnoremap <silent><leader>nf <cmd>NvimTreeFocus<cr>


""" ============================
"""   IndentLine configuration
""" ============================
let g:indent_blankline_filetype_exclude = ['alpha', 'toggleterm']


""" ===========================
"""   Telescope Configuration
""" ===========================
nnoremap <silent><leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent><leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent><leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent><leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent><leader>fd <cmd>Telescope builtin<cr>


""" =====================
"""   Dap Configuration
""" =====================
nnoremap <silent><F5> <cmd>lua require'dap'.continue()<cr>
nnoremap <silent><F10> <cmd>lua require'dap'.step_over()<cr>
nnoremap <silent><F11> <cmd>lua require'dap'.step_into()<cr>
nnoremap <silent><F12> <cmd>lua require'dap'.step_out()<cr>
nnoremap <silent><leader>db <cmd>lua require'dap'.toggle_breakpoint()<cr>
nnoremap <silent><leader>dB <cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>
nnoremap <silent><leader>dp <cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>
nnoremap <silent><leader>dr <cmd>lua require'dap'.repl.open()<cr>
nnoremap <silent><leader>dl <cmd>lua require'dap'.run_last()<cr>


""" ==============================
"""   Auto-session Configuration
""" ==============================
nnoremap <silent><leader>ss <cmd>SearchSession<cr>


""" ==========================
"""   WinShift Configuration
""" ==========================
nnoremap <silent><leader>wu <cmd>WinShift up<cr>
nnoremap <silent><leader>wd <cmd>WinShift down<cr>
nnoremap <silent><leader>wl <cmd>WinShift left<cr>
nnoremap <silent><leader>wr <cmd>WinShift right<cr>
nnoremap <silent><leader>ws <cmd>WinShift swap<cr>


""" ==========================
"""   Trouble Configuration 
""" ==========================
nnoremap <silent><leader>xx <cmd>TroubleToggle<cr>
nnoremap <silent><leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <silent><leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <silent><leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <silent><leader>xl <cmd>TroubleToggle loclist<cr>


""" ==========================
"""   DiffView Configuration 
""" ==========================
nnoremap <silent><leader>dd :DiffviewOpen<cr>
nnoremap <silent><leader>dc :DiffviewClose<cr>
nnoremap <silent><leader>df :DiffviewFileHistory<cr>
nnoremap <silent><leader>dr :DiffviewRefresh<cr>


""" =================================
"""   MarkdownPreview Configuration
""" =================================
nnoremap <silent><leader>pp :MarkdownPreview<cr>
nnoremap <silent><leader>pt :MarkdownPreviewToggle<cr>
nnoremap <silent><leader>ps :MarkdownPreviewStop<cr>


""" =======================
"""   CMake configuration 
""" =======================
nnoremap <silent><leader>mc :CMake configure<cr> 
nnoremap <silent><leader>mr :CMake run <cr>
nnoremap <silent><leader>mb :CMake build <cr>
nnoremap <silent><leader>ms :CMake select_target<cr>
nnoremap <silent><leader>mt :CMake select_build_type<cr>
nnoremap <silent><leader>mcc :CMake clean<cr>


