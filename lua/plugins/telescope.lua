local telescope = require('telescope')
telescope.setup({
	defaults = {
		mappings = {
			n = {
				['t'] = require('telescope.actions').select_tab,
			},
		},
	},

	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown({})
		},
	},
})
telescope.load_extension('ui-select')
telescope.load_extension('dap')
telescope.load_extension('session-lens')
