local ok, tree = pcall(require, 'nvim-tree')

if not ok then
	return
end

tree.setup({
	disable_netrw = false,

	git = {
		enable = false,
	},

	tab = {
		sync = {
			open = true,
			close = true,
		}
	}
})
