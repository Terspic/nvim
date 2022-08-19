local ok, bufferline = pcall(require, 'bufferline')
if not ok then
	return
end

bufferline.setup({
	options = {
		mode = "tabs", -- set to "tabs" to only show tabpages instead
		numbers = "none",
		close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
		left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
		-- NOTE: this plugin is designed with this icon in mind,
		-- and so changing this is NOT recommended, this is intended
		-- as an escape hatch for people who cannot bear it for whatever reason
		indicator_icon = '',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 20,
		---@diagnostic disable-next-line: assign-type-mismatch
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(_, _, diagnostics_dict, _)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " "
					or (e == "warning" and " " or " ")
				s = s .. n .. sym
			end
			return s
		end,
		diagnostics_update_in_insert = true,
		offsets = {
			{ filetype = "NvimTree", text = "File Explorer", text_align = "center" },
		},
		color_icons = true, -- whether or not to add the filetype icon highlights
		show_buffer_icons = true, -- disable filetype icons for buffers
		show_buffer_close_icons = true,
		show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
		show_close_icon = true,
		show_tab_indicators = false,
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		-- can also be a table containing 2 custom separators
		-- [focused and unfocused]. eg: { '|', '|' }
		separator_style = "thick",
		enforce_regular_tubs = true,
		always_show_bufferline = true,
	}
})
