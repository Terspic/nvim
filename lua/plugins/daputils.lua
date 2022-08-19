local dap = require('dap')
local Path = require('plenary.path')

local configs = {
	rust = {
		js = { lldb = { 'rust' } },
		raw = {
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
	},
	cpp = {
		js = { lldb = { 'c', 'cpp' } },
		raw = {
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
	},
	cs = {
		js = { coreclr = { 'cs', 'fs' } },
		raw = {
			type = 'coreclr',
			name = 'launch - netcoredbg',
			request = 'launch',
			program = function()
				return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/net6.0', 'file')
			end,
		}
	},
}

local function load_configs()
	if Path:new('.vscode/launch.json'):exists() then
		local vscode_ext = require('dap.ext.vscode')
		for _, l in pairs(configs) do
			vscode_ext.load_launchjs(nil, l.js)
		end
	else
		for k, l in pairs(configs) do
			dap.configurations[k] = {l.raw}
		end
	end

	-- TODO add duplicates configs 
	dap.configurations.c = dap.configurations.cpp
end

return {
    languages_configs = configs, load_debug_configs = load_configs
}
