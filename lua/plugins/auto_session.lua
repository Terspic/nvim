vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

require('auto-session').setup({
	log_level = 'info',
	auto_session_suppress_dirs = { '~/' },

	pre_save_cmds = {
		'tabdo NvimTreeClose', 'tabfirst',
		'ToggleTermToggleAll',
		'tabdo AerialCloseAll', 'tabfirst'
	},
	post_restore_cmds = { 'NvimTreeOpen' }
})
require('session-lens').setup {
	previewer = false,
	prompt_title = 'Sessions'
}
