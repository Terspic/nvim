local ok, tree = pcall(require, 'nvim-tree')

if not ok then
	return
end

tree.setup({
	disable_netrw = true,

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
