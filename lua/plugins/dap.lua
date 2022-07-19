local dap = require('dap')
local Path = require("plenary.path")

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

if Path:new(".vscode/launch.json"):exists() then
	require("dap.ext.vscode").load_launchjs(nil, { coreclr = { 'cs' } })
else
	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "launch - netcoredbg",
			request = "launch",
			program = function()
				return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/net6.0', 'file')
			end,
		}
	}
end

if Path:new(".vscode/launch.json"):exists() then
	require('dap.ext.vscode').load_launchjs(nil, { lldb = { 'rust' } })
else
	dap.configurations.rust = {
		{
			name = 'Launch',
			type = 'lldb',
			request = 'launch',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			args = {},
		}
	}
end

if Path:new(".vscode/launch.json"):exists() then
	require('dap.ext.vscode').load_launchjs(nil, { lldb = { 'cpp' } })
else
	dap.configurations.cpp = {
		{
			name = 'Launch',
			type = 'lldb',
			request = 'launch',
			program = function()
				return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/', 'file')
			end,
			cwd = '${workspaceFolder}',
			stopOnEntry = false,
			args = {},
		}
	}
end
dap.configurations.c = dap.configurations.cpp


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
			position = "left",
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
end
