# My Nvim Config 

This is my little but yet functionnal nvim configuration for developpment width basic IDE features (LSP, debugging, etc ...).

![screenshot](img/screenshot.png)

## Requirements 
- Linux or Nix compatible OS (may work on macOS)
- Nerd Font for fancy icons
- modern terminal (kitty for example)
- nvim [0.6](https://github.com/neovim/neovim/releases/tag/v0.6.1) and higher (lower version not tested)

## Plugins 

## KeyBindings

## Miscellaneous
```vim
nnoremap <leader>t :ToggleTerm<cr>
nnoremap <leader>r <cmd>source ~/.config/nvim/init.vim<cr>

noremap <silent> <c-Left> <cmd>vertical resize -3<cr>
noremap <silent> <c-Right> <cmd>vertical resize +3<cr>
noremap <silent> <c-Up> <cmd>resize +3<cr>
noremap <silent> <c-Down> <cmd>resize -3<cr>
```

### LSP 
- 

### NvimTree
- 

### Telescope 
- 

### Dap
-

### AutoSessions 
-

### Winshift
-

### Trouble
-

### DiffView 
-

### MarkdownPreview
-

## Languages supported (via LSP)
- Rust (rust-analyser)
- C/C++ (clangd)
- Python (jedi)
- Vim (vimls)
- Cmake (cmakels)
- Lua ()
- OmniSharp ()
- HTML / CSS / JSON / Eslint ()
