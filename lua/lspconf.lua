-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},
	mapping = {
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete({})),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'crates' },
	}),
	-- display icons in completion popup
    window = {
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
        },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"

            return kind
        end,
    },
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
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " "
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
	map("<leader>li", "<cmd>LspInfo<cr>")
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

-- Python Lsp
lsp_config.pylsp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
	}
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
				library = {
					vim.api.nvim_get_runtime_file("", true),
				},
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

-- WGSL Server
lsp_config.wgsl_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

-- bash server
lsp_config.bashls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lsp_config.html.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lsp_config.cssls.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lsp_config.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach
})

lsp_config.ols.setup({
    capabilities = capabilities,
    on_attach = on_attach
})
