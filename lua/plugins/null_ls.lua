local ok, null_ls = pcall(require, 'null-ls')
if not ok then
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.pylint.with({
			method = null_ls.methods.DIAGNOSTICS_ON_SAVE
		})
	}
})
