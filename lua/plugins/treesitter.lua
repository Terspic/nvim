vim.cmd[[au BufRead,BufNewFile *.wgsl	set filetype=wgsl]]
require('nvim-treesitter.configs').setup({
	ensure_installed = {'c', 'cpp', 'rust', 'lua', 'vim', 'wgsl', 'glsl'},
	sync_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_syntax = false,
	},
})
