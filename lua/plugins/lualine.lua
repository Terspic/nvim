local ok, lualine = pcall(require, 'lualine')
if not ok then
	return
end

local conditions = {
    lsp_running = function ()
        return #vim.lsp.get_clients() ~= 0
    end
}

local config = {
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = 'kanagawa',
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
            {
                'mode',
                color = { gui = "bold" }
            },
		},
		lualine_b = {
            {
                'branch',
                icon = '',
                color = { gui = "bold" }
            },
			'diagnostics',
		},
		lualine_c = {
		},
		lualine_x = {},
		lualine_y = {
            {
                function ()
                    return ''
                end,
                color = { bg = "#9CABCA", fg = "#1f2228", gui = "bold" },
                cond = conditions.lsp_running
            },
            {
                -- return lsp name if there is one running for the current filetype
                function ()
                    local clients = vim.lsp.get_clients()
                    local filetype = vim.bo.filetype
                    -- iter through running lsp 
                    for _, client in ipairs(clients) do
                        -- iter through filetypes
                        for _, client_ft in ipairs(client.config.filetypes) do
                            if client_ft == filetype then -- check if the lsp is running for the current filetype
                                return client.name
                            end
                        end
                    end
                    return ''
                end,
                color = { fg = "#9CABCA", gui = "bold" },
                cond = conditions.lsp_running
            },
            {
                function ()
                    return ''
                end,
                color = { fg = '#191f2b', bg = '#7E9CD8' }
            },
            {
                'fileformat',
                symbols = {
                    unix = 'LF',
                    dos = 'CRLF',
                    mac = 'CR',
                },
                color = { fg = '#7E9CD8', gui = "bold" }
            },
            {
                function()
                    return '󰍜'
                end,
                color = { fg = "#141a1d", bg = "#658594" }
            },
            {
                'location',
                color = { fg = "#658594", gui = "bold" }
            },
        },
        lualine_z = {},
	},
	extensions = { 'quickfix' }
}

lualine.setup(config)
