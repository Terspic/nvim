local ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
if not ok then
	return
end

ts_configs.setup({
	ensure_installed = {'c', 'cpp', 'rust', 'lua', 'glsl'},

	sync_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_syntax = false,
	},

	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- function definition
				["af"] = "@function.outer",
				["if"] = "@function.inner",

				-- call of a function
				["ac"] = "@call.outer",
				["ic"] = "@call.inner",

				-- parameter
				["ap"] = "@parameter.outer",
				["ip"] = "@parameter.inner",

				-- parameter
				["ai"] = "@conditional.outer",
				["ii"] = "@conditional.inner",
			}
		}
	}
})
