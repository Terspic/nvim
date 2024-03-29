local ok, dap = pcall(require, 'dap')
if not ok then
	return
end

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

local daputils = require('plugins.daputils')
daputils.load_debug_configs()

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
		{
			elements = {
				{ id = 'repl', size = 0.25 },
				{ id = 'console', size = 0.75 },
			},
			position = 'bottom',
			size = 0.25,
		}
	},
})
dap.listeners.after.event_initialized['dapui_config'] = function()
	dapui.open({})
end
dap.listeners.before.event_terminated['dapui_config'] = function()
	dapui.close({})
end
dap.listeners.before.event_exited['dapui_config'] = function()
	dapui.close({})
end
