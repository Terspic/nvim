local ok, diffview = pcall(require, 'diffview')
if not ok then
	return
end

diffview.setup({
	enhanced_diff_hl = true,
	use_icons = true,
})
