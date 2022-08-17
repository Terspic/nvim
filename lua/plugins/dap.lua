local dap = require('dap')

dap.adapters.lldb = {
	type = 'executable',
	command = 'lldb-vscode',
	name = 'lldb',
}

dap.adapters.coreclr = {
	type = 'executable',
	command = 'netcoredbg',
	args = { '--interpreter=vscode' },
}

local dapui = require('dapui')
dapui.setup({
	layouts = {
		{
			elements = {
				{ id = 'scopes', size = 0.5 },
				{ id = 'breakpoints', size = 0.25 },
				{ id = 'watches', size = 0.25 },
			},
			size = 40,
			position = 'left',
		},
	},
})
dap.listeners.after.event_initialized['dapui_config'] = function()
	vim.cmd('NvimTreeClose')
	dapui.open({})
end
dap.listeners.before.event_terminated['dapui_config'] = function()
	dapui.close({})
end
dap.listeners.before.event_exited['dapui_config'] = function()
	dapui.close({})
	vim.cmd('NvimTreeOpen')
end
