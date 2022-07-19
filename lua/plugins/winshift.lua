require('winshift').setup({
	window_picker = function()
		return require('winshift.lib').pick_window({
			filter_rules = {
				filtype = {
					"NvimTree"
				},
			},
		})
	end,
})
