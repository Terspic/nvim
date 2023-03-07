local group = vim.api.nvim_create_augroup("Rust", { clear = true })

-- remap Cargo function
vim.api.nvim_create_autocmd(
	{ "BufEnter" },
	{
		group = group,
		pattern = "*.rs",
		callback = function()
			vim.keymap.set("n", "<leader>rr", ":Cargo run<cr>", { silent = true })
			vim.keymap.set("n", "<leader>rR", ":Cargo run --release<cr>", { silent = true })
			vim.keymap.set("n", "<leader>rb", ":Cargo build<cr>", { silent = true })
			vim.keymap.set("n", "<leader>rB", ":Cargo build --release<cr>", { silent = true })
			vim.keymap.set("n", "<leader>rc", ":Cargo clean<cr>", { silent = true })
		end
	}
)
