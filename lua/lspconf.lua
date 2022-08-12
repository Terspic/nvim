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

local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end


-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp_config = require('lspconfig')

local function on_attach(client, bufnr)
	require('aerial').on_attach(client, bufnr)
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

-- Vim Language server
lsp_config.vimls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- CMake Language server
lsp_config.cmake.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Lua Language server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp_config.sumneko_lua.setup {
	capabilities = capabilities,
	on_attach = on_attach,
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
lsp_config.omnisharp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { omnisharp_bin, '--languageserver', '--hostPID', tostring(pid) },
})

lsp_config.fsautocomplete.setup({
	capabilities = capabilities,
	on_attach = on_attach,
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
lsp_config.eslint.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
