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
	},

	pickers = {
		find_files = {
			previewer = false,
		}
	},

	extensions = {
		['ui-select'] = {
			require('telescope.themes').get_dropdown({})
		},
		dap = {
			require('telescope.themes').get_dropdown({})
		}
	},
})
telescope.load_extension('ui-select')
telescope.load_extension('dap')
telescope.load_extension('session-lens')
