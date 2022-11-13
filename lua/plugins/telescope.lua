local ok, telescope = pcall(require, 'telescope')
if not ok then
	return
end

telescope.setup({
	defaults = {
		mappings = {
			n = {
				['t'] = require('telescope.actions').select_tab,
			},
		},
		prompt_prefix = "> "
	},

	pickers = {
		find_files = {
			previewer = false,
			layout_config = {
				horizontal = { width = 0.5, height = 0.5 },
			},
		}
	},

	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_cursor({})
		},
	},
})
telescope.load_extension('ui-select')
telescope.load_extension('dap')
telescope.load_extension('session-lens')
