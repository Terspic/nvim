local ok, wk = pcall(require, 'which-key')
if not ok then
    return
end

vim.cmd [[
nnoremap <space> <Nop>
let mapleader = " "
]]

-- resizing windows
vim.keymap.set("n", "<C-left>", "<cmd>vertical resize -3<cr>", { silent = true })
vim.keymap.set("n", "<c-right>", "<cmd>vertical resize +3<cr>", { silent = true })
vim.keymap.set("n", "<C-up>", "<cmd>resize +3<cr>", { silent = true })
vim.keymap.set("n", "<C-down>", "<cmd>resize -3<cr>", { silent = true })

-- remap C-w to C-movement
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

wk.setup({})
wk.add({
    { "<F10>", '<cmd>lua require("dap").step_over()<cr>', desc = "debug step over" },
    { "<F11>", '<cmd>lua require("dap").step_into()<cr>', desc = "debug step into" },
    { "<F12>", '<cmd>lua require("dap").step_out()<cr>', desc = "debug step out" },
    { "<F5>", '<cmd>lua require("dap").continue()<cr>', desc = "debug continue" },
    { "<leader>W", "<cmd>wa<cr>", desc = "save the current buffer" },
    { "<leader>bC", "<cmd>%bd|e#<cr>", desc = "close all buffer" },
    { "<leader>bc", "<cmd>bd %<cr>", desc = "close buffer" },
    { "<leader>c", group = "crates" },
    { "<leader>cA", ':lua require("crates").upgrade_all_crates()<cr>', desc = "upgrade all crates" },
    { "<leader>cC", ':lua require("crates").open_crates_io()<cr>', desc = "open crates.io" },
    { "<leader>cD", ':lua require("crates").open_documentation()<cr>', desc = "open documentation" },
    { "<leader>cH", ':lua require("crates").open_homepage()<cr>', desc = "open homepage" },
    { "<leader>cR", ':lua require("crates").open_repository()<cr>', desc = "open repo" },
    { "<leader>cU", ':lua require("crates").upgrade_crate()<cr>', desc = "upgrade crate" },
    { "<leader>cd", ':lua require("crates").show_dependencies_popup()<cr>', desc = "show dependencies" },
    { "<leader>cf", ':lua require("crates").show_features_popup()<cr>', desc = "show features" },
    { "<leader>cr", ':lua require("crates").reload()<cr>', desc = "reload crates" },
    { "<leader>cs", ':lua require("crates").show_popup()<cr>', desc = "show info" },
    { "<leader>ct", ':lua require("crates").toggle()<cr>', desc = "toggle crates" },
    { "<leader>cu", ':lua require("crates").update_crate()<cr>', desc = "update crate" },
    { "<leader>cv", ':lua require("crates").show_versions_popup()<cr>', desc = "show versions" },
    { "<leader>d", group = "debug" },
    { "<leader>dB", '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition : "))<cr>', desc = "condiational breakpoint" },
    { "<leader>db", '<cmd>lua require("dap").toggle_breakpoint()<cr>', desc = "breakpoint" },
    { "<leader>dc", "<cmd>Telescope dap commands theme=dropdown<cr>", desc = "commands" },
    { "<leader>dl", "<cmd>Telescope dap list_breakpoints<cr>", desc = "breakpoints" },
    { "<leader>dp", '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>', desc = "log breakpoint" },
    { "<leader>dr", '<cmd>lua require("dap").repl.open()<cr>', desc = "repl" },
    { "<leader>f", group = "find" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "buffers" },
    { "<leader>fd", "<cmd>Telescope builtin<cr>", desc = "builtins" },
    { "<leader>ff", "<cmd>Telescope find_files <cr>", desc = "files" },
    { "<leader>fg", "<cmd>Telescope git_files theme=dropdown <cr>", desc = "git files" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "help" },
    { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "recent" },
    { "<leader>fp", "<cmd>Telescope live_grep<cr>", desc = "grep" },
    { "<leader>fs", "<cmd>Telescope treesitter<cr>", desc = "symbols" },
    { "<leader>g", group = "git" },
    { "<leader>gd", group = "diffview" },
    { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "close" },
    { "<leader>gdd", "<cmd>DiffviewOpen<cr>", desc = "open" },
    { "<leader>gdf", "<cmd>DiffviewFileHistory<cr>", desc = "file history" },
    { "<leader>gdr", "<cmd>DiffviewRefresh<cr>", desc = "refresh view" },
    { "<leader>gh", group = "hunk" },
    { "<leader>ghK", "<cmd>Gitsigns preview_hunk<cr>", desc = "preview hunk" },
    { "<leader>ghn", "<cmd>Gitsigns next_hunk<cr>", desc = "next hunk" },
    { "<leader>ghp", "<cmd>Gitsigns prev_hunk<cr>", desc = "prev hunk" },
    { "<leader>ghu", "<cmd>Gitsigns reset_hunk<cr>", desc = "reset hunk" },
    { "<leader>gs", group = "stage" },
    { "<leader>m", group = "cmake" },
    { "<leader>mR", "<cmd>CMake build_and_run<cr>", desc = "build and run" },
    { "<leader>mb", "<cmd>CMake build<cr>", desc = "build" },
    { "<leader>mc", "<cmd>CMake configure<cr>", desc = "configure" },
    { "<leader>mr", "<cmd>CMake run<cr>", desc = "run" },
    { "<leader>ms", "<cmd>CMake select_target<cr>", desc = "target" },
    { "<leader>mt", "<cmd>CMake select_build_type<cr>", desc = "build_type" },
    { "<leader>mx", "<cmd>CMake clean<cr>", desc = "clean" },
    { "<leader>n", group = "nvim" },
    { "<leader>nc", "<cmd>CreateClass<cr>", desc = "Create a new C class" },
    { "<leader>np", group = "packages" },
    { "<leader>npc", "<cmd>PackerCompile<cr>", desc = "compile packages" },
    { "<leader>npi", "<cmd>PackerInstall<cr>", desc = "install packages" },
    { "<leader>npr", "<cmd>PackerClean<cr>", desc = "remove packages" },
    { "<leader>npu", "<cmd>PackerSync<cr>", desc = "update packages" },
    { "<leader>nr", "<cmd>so ~/.config/nvim/init.lua<cr>", desc = "reload config" },
    { "<leader>ns", "<cmd>source %<cr>", desc = "source current file" },
    { "<leader>o", group = "open" },
    { "<leader>oT", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "terminal horizontal" },
    { "<leader>oc", "<cmd>cd ~/.config/nvim/<cr> <cmd>SessionRestore<cr>", desc = "config" },
    { "<leader>od", "<cmd>Trouble todo toggle<cr>", desc = "open TODOs" },
    { "<leader>of", "<cmd>NvimTreeToggle<cr>", desc = "file tree" },
    { "<leader>oq", "<cmd>Trouble quickfix toggle<cr>", desc = "quickfix" },
    { "<leader>os", "<cmd>SearchSession<cr>", desc = "essions" },
    { "<leader>ot", "<cmd>ToggleTerm direction=float<cr>", desc = "terminal float" },
    { "<leader>ou", "<cmd>UndotreeToggle<cr>", desc = "open undo tree" },
    { "<leader>ox", "<cmd>Trouble diagnostics toggle<cr>", desc = "diagnostics" },
    { "<leader>q", "<cmd>bd<cr>", desc = "close current buffer" },
    { "<leader>s", group = "session" },
    { "<leader>ss", "<cmd>SearchSession <cr>", desc = "search" },
    { "<leader>sv", "<cmd>SaveSession <cr>", desc = "save" },
    { "<leader>w", "<cmd>w<cr>", desc = "save the current buffer" },
    { "<s-tab>", "<cmd>bp<cr>", desc = "prev buffer" },
    { "<tab>", "<cmd>bn<cr>", desc = "next buffer" },
})
