-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
    },
    mapping = {
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete()),
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
		format =
			lspkind.cmp_format({
				mode ='symbol_text',
				maxwidth = 50,
		})
	}
})

-- Use buffer source for `/`
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' }
	})
})


-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- rust analyser
require('lspconfig').rust_analyzer.setup({
    capabilities = capabilities,
	cargo = {
		allFeatures = true,
	},
})

-- Python Jedi
require('lspconfig').jedi_language_server.setup({
	capabilities = capabilities,
})

-- Clangd
require('lspconfig').clangd.setup({
	capabilities = capabilities,
})

-- Vim Language server
require('lspconfig').vimls.setup({
	capabilities = capabilities,
})

-- CMake Language server
require('lspconfig').cmake.setup({
	capabilities = capabilities,
})

-- Lua Language server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = runtime_path,
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
local omnisharp_bin = '/usr/bin/omnisharp'
require('lspconfig').omnisharp.setup({
	capabilities = capabilities,
	cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
})
