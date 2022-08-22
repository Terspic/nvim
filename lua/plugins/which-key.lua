local ok, wk = pcall(require, 'which-key')
if not ok then
	return
end

vim.cmd [[
nnoremap <space> <Nop>
let mapleader = " "
 
nnoremap <silent> <c-Left> <cmd>vertical resize -3<cr>
nnoremap <silent> <c-Right> <cmd>vertical resize +3<cr>
nnoremap <silent> <c-Up> <cmd>resize +3<cr>
nnoremap <silent> <c-Down> <cmd>resize -3<cr>
]]


wk.setup({})

wk.register({
	['<F2>'] = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'lsp rename' },
	['<F5>'] = { '<cmd>lua require("dap").continue()<cr>', 'debug conitnue' },
	['<F10>'] = { '<cmd>lua require("dap").step_over()<cr>', 'debug step over' },
	['<F11>'] = { '<cmd>lua require("dap").step_into()<cr>', 'debug step into' },
	['<F12>'] = { '<cmd>lua require("dap").step_out()<cr>', 'debug step out' },

	['<leader>'] = {
		o = {
			name = "+others",
			t = { '<cmd>ToggleTerm direction=horizontal<cr>', 'toggle terminal' },
			c = { '<cmd>PackerCompile<cr>', 'compile packages' },
			u = { '<cmd>PackerSync<cr>', 'update packages' },
			i = { '<cmd>PackerInstall<cr>', 'install packages' },
			r = { '<cmd>PackerClean<cr>', 'remove packages' },
			s = { '<cmd>source %<cr>', 'source current file' },

		},
		q = {
			name = 'quickfix',
			o = { '<cmd>bo copen<cr>', 'open' },
			c = { '<cmd>cclose<cr>', 'close' },
		},
		c = {
			name = '+code',
			g = {
				name = '+go to',
				d = { '<cmd>Telescope lsp_definitions initial_mode=normal<cr>', 'defintions' },
				i = { '<cmd>Telescope lsp_implementations initial_mode=normal<cr>', 'implementations' },
				t = { '<cmd>Telescope lsp_type_definitions initial_mode=normal<cr>', 'type def' },
			},
			s = {
				name = '+symbols',
				w = { '<cmd>Telescope lsp_workspace_symbols initial_mode=normal<cr>', 'workspace' },
				d = { '<cmd>Telescope lsp_document_symbols initial_mode=normal<cr>', 'document' },
			},
			d = {
				name = "+diagnostics",
				d = { '<cmd>Telescope diagnostics initial_mode=normal<cr>', 'list' },
				p = { '<cmd>lua vim.diagnostic.goto_prev()<cr>', 'prev' },
				n = { '<cmd>lua vim.diagnostic.goto_next()<cr>', 'next' },
			},
			a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'actions' },
			r = { '<cmd>Telescope lsp_references initial_mode=normal<cr>', 'references' },
		h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'hover' },
			f = { '<cmd>lua vim.lsp.buf.formatting()<cr>', 'format' },
		},
		t = {
			name = '+tree',
			o = { '<cmd>NvimTreeOpen <cr>', 'open' },
			c = { '<cmd>NvimTreeClose<cr>', 'close' },
			t = { '<cmd>NvimTreeToggle<cr>', 'toggle' },
			f = { '<cmd>NvimTreeFocus<cr>', 'focus' },
		},
		f = {
			name = '+find',
			f = { '<cmd>Telescope find_files theme=dropdown<cr>', 'files' },
			b = { '<cmd>Telescope buffers<cr>', 'buffers' },
			h = { '<cmd>Telescope help_tags<cr>', 'help' },
			d = { '<cmd>Telescope builtin<cr>', 'builtins' },
			g = { '<cmd>Telescope live_grep<cr>', 'grep' },
			o = { '<cmd>Telescope oldfiles<cr>', 'recent' },
			s = { '<cmd>Telescope treesitter<cr>', 'symbols' },
		},
		d = {
			name = '+debug',
			c = { '<cmd>Telescope dap commands theme=dropdown<cr>', 'commands' },
			b = { '<cmd>lua require("dap").toggle_breakpoint()<cr>', 'breakpoint' },
			B = { '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Brekapoint condition : "))<cr>', 'condiational breakpoint' },
			p = { '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>', 'log breakpoint' },
			r = { '<cmd>lua require("dap").repl.open()<cr>', 'repl' },
			l = { '<cmd>lua require("dap").run_last()<cr>', 'run last' },
		},
		s = {
			name = '+session',
			s = { '<cmd>SearchSession <cr>', 'search' },
		},
		w = {
			name = 'winshift',
			u = { '<cmd>WinShift up<cr>', 'up' },
			d = { '<cmd>WinShift down<cr>', 'down' },
			l = { '<cmd>WinShift left<cr>', 'left' },
			r = { '<cmd>WinShift right<cr>', 'right' },
			s = { '<cmd>WinShift swap<cr>', 'swap' },
		},
		x = {
			name = 'trouble',
			x = { '<cmd>TroubleToggle<cr>', 'toggle' },
			w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'workspace diagnostics' },
			d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'document diagnostics' },
			q = { '<cmd>TroubleToggle quickfix<cr>', 'quickfix' },
			l = { '<cmd>TroubleToggle loclist<cr>', 'loclist' },
		},
		g = {
			name = '+git',
			d = {
				name = '+diffview',
				d = { '<cmd>DiffviewOpen<cr>', 'open' },
				c = { '<cmd>DiffviewClose<cr>', 'close' },
				f = { '<cmd>DiffviewFileHistory<cr>', 'file history' },
				r = { '<cmd>DiffviewRefresh<cr>', 'refresh view' },
			}
		},
		p = {
			name = "+md preview",
			p = { '<cmd>MarkdownPreview<cr>', 'preview' },
			t = { '<cmd>MarkdownPreviewToggle<cr>', 'toggle' },
			s = { '<cmd>MarkdownPreviewStopt<cr>', 'stop' }
		},
		m = {
			name = 'cmake',
			c = { '<cmd>CMake configure<cr>', 'configure' },
			r = { '<cmd>CMake run<cr>', 'run' },
			b = { '<cmd>CMake build<cr>', 'build' },
			s = { '<cmd>CMake select_target<cr>', 'target' },
			t = { '<cmd>CMake select_build_type<cr>', 'build_type' },
			x = { '<cmd>CMake clean<cr>', 'clean' },
		},
		b = {
			name = "+buffers",
			n = { "<cmd>bnext<cr>", "next" },
			p = { "<cmd>bprev<cr>", "prev" },
			e = { "<cmd>ene<cr>", "new buffer" },
			d = { "<cmd>bd d%<cr>", "delete current buffer" },
		}
	}
})
