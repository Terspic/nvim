local ok, toggle_term = pcall(require, 'toggleterm')
if not ok then
  return
end

toggle_term.setup({})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
end

local group = vim.api.nvim_create_augroup("ToggleTerm", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = set_terminal_keymaps,
  group = group
})
