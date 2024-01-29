local group = vim.api.nvim_create_augroup("Deca", { clear = true })
vim.api.nvim_create_autocmd(
	{"BufRead", "BufNewFile"},
	{
		pattern = "*.deca",
		command = "set filetype=java",
		group = group
	}
)
