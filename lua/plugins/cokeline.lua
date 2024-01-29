local ok, cokeline = pcall(require, 'cokeline')

if not ok then
    return
end

local get_hex = require('cokeline.hlgroups').get_hl_attr
local colors = require('kanagawa.colors').setup().palette
local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " "
}


cokeline.setup({
    buffers = {
        new_buffers_position = "number",
    },
    default_hl = {
        fg = function(buffer)
            return
                buffer.is_focused
                and colors.fujiWhite
                or get_hex('Comment', 'fg')
        end,
        bg = function (buffer)
            return buffer.is_focused and colors.sumiInk4 or colors.sumiInk2
        end,
        underline = function(buffer)
            return buffer.is_focused
        end,
        sp = colors.crystalBlue
    },
    sidebar = {
        filetype = { "NvimTree" },
        components = {
            {
                text = function (buffer)
                    return '    ' .. '󰙅' .. ' ' .. buffer.filetype
                end,
                bold = true,
                fg = colors.carpYellow,
                bg = colors.sumiInk2,
                underline = true,
                sp = colors.crystalBlue
            }
        },
    },
    components = {
        {
            text = function(buffer) return '    ' .. buffer.devicon.icon end,
            fg = function(buffer) return buffer.devicon.color end,
        },
        {
            text = function(buffer) return buffer.filename .. '  ' end,
        },
        { -- errors
            text = function(buffer)
                local errors = buffer.diagnostics.errors
                return errors ~= 0 and signs.Error .. errors .. '  ' or ''
            end,
            fg = colors.samuraiRed
        },
        { -- warnings
            text = function(buffer)
                local warnings = buffer.diagnostics.warnings
                return warnings ~= 0 and signs.Warn .. warnings .. '  ' or ''
            end,
            fg = colors.roninYellow
        },
        {
            text = '󰖭',
            on_click = function(_, _, _, _, buffer)
                buffer:delete()
            end
        },
        {
            text = '  ',
        },
    },
    tabs = {
        placement = "right",
        components = {
            {
                text = function(tab)
                    return '  ' .. tab.number .. '  '
                end,
                fg = function(tab)
                    return tab.is_active and colors.crystalBlue or colors.fujiGray
                end,
                sp = function(tab)
                    return tab.is_active and colors.crystalBlue or colors.sumiInk2
                end,
                underline = true
            }
        }
    }
})
