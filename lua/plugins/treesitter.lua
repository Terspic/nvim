local ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

ts_configs.setup({
	ensure_installed = {'c', 'cpp', 'rust', 'lua', 'vim', 'wgsl', 'glsl'},

	sync_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_syntax = false,
	},
})
