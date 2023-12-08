local ok, crates = pcall(require, "crate.nvim")

if not ok then
	return
end

crates.setup({})
