local lsp_rename = function (new_name)
	local pos_params = vim.lsp.util.make_position_params()
	pos_params.newName = new_name

	vim.lsp.buf_request(0, "textDocument/rename", pos_params, function (err, result, ctx, config)
		vim.lsp.handlers["textDocument/rename"](err, result, ctx, config)
	end)
end

local rename = function ()
	local Input = require("nui.input")

	local popup_opts = {
		relative = "cursor",
		position = {
			col = 0,
			row = 0,
		},
		size = 20,
		border = {
			style = "rounded",
			text = {
				top = "[Rename]",
				top_align = "left",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}

	local rename_input = Input(popup_opts, {
		prompt = "> ",
		default_value = vim.fn.expand("<cword>"),
		on_close = function() end,
		on_submit = function(new_name)
			lsp_rename(new_name)
		end,
		on_change = function() end
	})

	rename_input:mount()
	rename_input:map("n", "<Esc>", function() rename_input:unmount() end, { noremap = true })
	rename_input:show()
end

return {
	rename = rename
}
