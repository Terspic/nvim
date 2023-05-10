local ok, auto_session = pcall(require, 'auto-session')
if not ok then
    return
end

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

auto_session.setup({
	log_level = 'info',
	auto_session_suppress_dirs = { '~/' },

	pre_save_cmds = {
		'ToggleTermToggleAll', 'NvimTreeClose'
	},
	post_restore_cmds = { require('plugins.daputils').load_debug_configs }
})
require('session-lens').setup {
	previewer = false,
	prompt_title = 'Sessions',
	theme_conf = {
		border = true,
		winblend = 0,
	}
}
