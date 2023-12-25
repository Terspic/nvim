-- all python specific configurationSection
local group = vim.api.nvim_create_augroup("Python", { clear = true })
vim.api.nvim_create_autocmd(
	"BufWritePre",
	{
		pattern = "*.py",
		command = "%s/\\s\\+$//e",
		group = group
	}
)
