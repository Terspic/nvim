local group = vim.api.nvim_create_augroup("Wgsl", { clear = true })
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"},
	{
		pattern = "*.wgsl",
		command = "set filetype=wgsl",
		group = group
	}
)
