local Input = require('nui.input')

local function rename()
	local current_name = vim.fn.expand("<cword>")
	local lsp_params = vim.lsp.util.make_position_params()

	local function on_submit(new_name)
		if not new_name or #new_name == 0 or current_name == new_name then
			return
		end

		lsp_params.newName = new_name

		vim.lsp.buf_request(0, "textDocument/rename", lsp_params, function(_, result, ctx, _)
			if not result then
				return
			end

			local client = vim.lsp.get_client_by_id(ctx.client_id)
			vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)
		end)
	end

	local popup_opts = {
		border = {
			style = "rounded",
			text = {
				top = "[Rename]",
				top_align = "left",
			},
		},
		highlight = "Normal:Normal",
		relative = {
			type = "buf",
			position = {
				row = lsp_params.position.line,
				col = lsp_params.position.character,
			},
		},
		position = {
			row = 1,
			col = 0,
		},
		size = {
			width = 30,
			height = 1,
		},
	}

	local input = Input(popup_opts, {
			default_value = current_name,
			on_submit = on_submit,
			prompt = ""
		})

	input:mount()
	input:map("n", "<esc>", input.input_props.on_close, {noremap = true})
end

return { rename = rename }
