local ok, winshift = pcall(require, 'winshift')
if not ok then
	return
end

winshift.setup({
	window_picker = function()
		return require('winshift.lib').pick_window({
			filter_rules = {
				filtype = {
				},
			},
		})
	end,
})
