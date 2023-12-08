local ok, bufferline = pcall(require, 'bufferline')
if not ok then
	return
end

local theme = require('kanagawa.colors').setup({}).palette

bufferline.setup({
	options = {
		mode = "buffer", -- set to "tabs" to only show tabpages instead
		themable = true,
		numbers = 'none',
		style_preset = {
			bufferline.style_preset.no_bold,
			bufferline.style_preset.no_italic
		},
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 22,
		---@diagnostic disable-next-line: assign-type-mismatch
		-- diagnostics = "nvim_lsp",
		-- diagnostics_indicator = function(_, _, diagnostics_dict, _)
		-- 	local s = " "
		-- 	for e, n in pairs(diagnostics_dict) do
		-- 		local sym = e == "error" and " "
		-- 			or (e == "warning" and " " or " ")
		-- 		s = s .. n .. sym
		-- 	end
		-- 	return s
		-- end,
		-- diagnostics_update_in_insert = true,
		offsets = {
			{ filetype = "NvimTree", text = "File Explorer", text_align = "center" },
		},
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		-- show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
		show_close_icon = true,
		show_tab_indicators = true,
		persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = 'thin',

		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = 'id',
	},
	highlights = {
		tab_selected = {
			fg = theme.crystalBlue,
			bg = theme.sumiInk3,
			sp = theme.crystalBlue,
			bold = true,
		},
		tab_separator = {
			fg = theme.sumiInk1,
			sp = theme.crystalBlue,
		},
		tab_separator_selected = {
			fg = theme.sumiInk3,
			bg = theme.sumiInk3,
			sp = theme.crystalBlue,
		},
		tab_close = {
			fg = theme.sumiInk1,
			bg = theme.peachRed
		},
	},
})
