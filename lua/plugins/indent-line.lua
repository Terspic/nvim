local ok, ibl = pcall(require, "ibl")

if not ok then
	return
end

ibl.setup({
	indent = {
		char = "▎",
	},
	exclude = {
		filetypes = {'alpha', 'toggleterm'}
	}
})
