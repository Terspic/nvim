-- Setup nvim-cmp.
local cmp = require 'cmp'
local lspkind = require('lspkind')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete({})),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'buffer' },
		{ name = 'crates' },
	}),
	-- display icons in completion popup
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			maxwidth = 50,
		})
	}
})

-- Use buffer source for `/`
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' },
	}
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' }
	})
})


local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " "
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end


-- Setup Mason
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})
require('mason-lspconfig').setup({
	ensure_installed = { 'lua_ls', 'rust_analyzer', 'clangd' },
})


-- Setup lspconfig.
local capabilities =
	require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_config = require('lspconfig')

local function on_attach(_, bufnr)
	-- little helper for keymaps
	local map = function(keybinding, action)
		vim.keymap.set("n", keybinding, action, { silent = true, buffer = bufnr })
	end

	local builtin_telescope = require('telescope.builtin')

	local lsp_rename = require('lsp_ui').rename

	map("gd", vim.lsp.buf.definition)
	map("gD", builtin_telescope.lsp_definitions)
	map("<leader>gi", builtin_telescope.lsp_implementations)
	map("<leader>lr", builtin_telescope.lsp_references)
	map("<leader>lf", vim.lsp.buf.format)
	map("<leader>la", vim.lsp.buf.code_action)
	map("<F2>", lsp_rename)
	map("K", vim.lsp.buf.hover)
end

-- rust analyser
lsp_config.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			checkOnSave = {
				allFeatures = true,
			},
			procMarco = {
				enable = true,
			}
		},
	},
})

-- Python Jedi
lsp_config.jedi_language_server.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Clangd
lsp_config.clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- CMake Language server
lsp_config.cmake.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Lua Language server
lsp_config.lua_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

-- OmniSharp Language server
local pid = vim.fn.getpid()
lsp_config.omnisharp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "omnisharp", '--languageserver', '--hostPID', tostring(pid) },
})

-- HTML CSS Javascript Language server
lsp_config.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lsp_config.html.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
lsp_config.jsonls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Lsp for javascript and typescript
lsp_config.tsserver.setup({})
