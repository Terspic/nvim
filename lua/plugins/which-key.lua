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
wk.register({
    ['<F5>'] = { '<cmd>lua require("dap").continue()<cr>', 'debug continue' },
    ['<F10>'] = { '<cmd>lua require("dap").step_over()<cr>', 'debug step over' },
    ['<F11>'] = { '<cmd>lua require("dap").step_into()<cr>', 'debug step into' },
    ['<F12>'] = { '<cmd>lua require("dap").step_out()<cr>', 'debug step out' },

    ['<leader>'] = {
        o = {
            name = '+open',
            t = { '<cmd>ToggleTerm direction=float<cr>', 'terminal float' },
            T = { '<cmd>ToggleTerm direction=horizontal<cr>', 'terminal horizontal' },
            c = { '<cmd>cd ~/.config/nvim/<cr> <cmd>SessionRestore<cr>', 'config' },
            q = { '<cmd>TroubleToggle quickfix<cr>', 'quickfix' },
            x = { '<cmd>TroubleToggle document_diagnostics<cr>', 'diagnostics' },
            s = { '<cmd>SearchSession<cr>', 'sessions' },
            f = { '<cmd>NvimTreeToggle<cr>', 'file tree' },
            d = { '<cmd>TodoTrouble<cr>', 'open TODOs' },
            u = { '<cmd>UndotreeToggle<cr>', 'open undo tree' },
            e = { '<cmd>TroubleToggle<cr>', 'Toggle trouble' },
        },
        n = {
            name = "+nvim",
            p = {
                name = '+packages',
                c = { '<cmd>PackerCompile<cr>', 'compile packages' },
                u = { '<cmd>PackerSync<cr>', 'update packages' },
                i = { '<cmd>PackerInstall<cr>', 'install packages' },
                r = { '<cmd>PackerClean<cr>', 'remove packages' },
            },
            r = { '<cmd>so ~/.config/nvim/init.lua<cr>', 'reload config' },
            s = { '<cmd>source %<cr>', 'source current file' },
            c = { '<cmd>CreateClass<cr>', 'Create a new C class' },
        },
        f = {
            name = '+find',
            f = { '<cmd>Telescope find_files <cr>', 'files' },
            b = { '<cmd>Telescope buffers<cr>', 'buffers' },
            h = { '<cmd>Telescope help_tags<cr>', 'help' },
            d = { '<cmd>Telescope builtin<cr>', 'builtins' },
            p = { '<cmd>Telescope live_grep<cr>', 'grep' },
            g = { '<cmd>Telescope git_files theme=dropdown <cr>', 'git files' },
            o = { '<cmd>Telescope oldfiles<cr>', 'recent' },
            s = { '<cmd>Telescope treesitter<cr>', 'symbols' },
        },
        d = {
            name = '+debug',
            l = { '<cmd>Telescope dap list_breakpoints<cr>', 'breakpoints' },
            c = { '<cmd>Telescope dap commands theme=dropdown<cr>', 'commands' },
            b = { '<cmd>lua require("dap").toggle_breakpoint()<cr>', 'breakpoint' },
            B = { '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition : "))<cr>', 'condiational breakpoint' },
            p = { '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>', 'log breakpoint' },
            r = { '<cmd>lua require("dap").repl.open()<cr>', 'repl' },
        },
        s = {
            name = '+session',
            s = { '<cmd>SearchSession <cr>', 'search' },
            v = { '<cmd>SaveSession <cr>', 'save' },
        },
        g = {
            name = '+git',
            d = {
                name = '+diffview',
                d = { '<cmd>DiffviewOpen<cr>', 'open' },
                c = { '<cmd>DiffviewClose<cr>', 'close' },
                f = { '<cmd>DiffviewFileHistory<cr>', 'file history' },
                r = { '<cmd>DiffviewRefresh<cr>', 'refresh view' },
            },
            h = {
                name = 'hunk',
                K = { '<cmd>Gitsigns preview_hunk<cr>', 'preview hunk' },
                u = { '<cmd>Gitsigns reset_hunk<cr>', 'reset hunk' },
                n = { '<cmd>Gitsigns next_hunk<cr>', 'next hunk' },
                p = { '<cmd>Gitsigns prev_hunk<cr>', 'prev hunk' },
            },
            s = {
                name = "stage"
            },
        },
        c = {
            name = "crates",
            t    = { ':lua require("crates").toggle()<cr>', 'toggle crates' },
            r    = { ':lua require("crates").reload()<cr>', 'reload crates' },

            s    = { ':lua require("crates").show_popup()<cr>', 'show info' },
            v    = { ':lua require("crates").show_versions_popup()<cr>', 'show versions' },
            f    = { ':lua require("crates").show_features_popup()<cr>', 'show features' },
            d    = { ':lua require("crates").show_dependencies_popup()<cr>', 'show dependencies' },

            u    = { ':lua require("crates").update_crate()<cr>', 'update crate' },
            U    = { ':lua require("crates").upgrade_crate()<cr>', 'upgrade crate' },
            A    = { ':lua require("crates").upgrade_all_crates()<cr>', 'upgrade all crates' },

            H    = { ':lua require("crates").open_homepage()<cr>', 'open homepage' },
            R    = { ':lua require("crates").open_repository()<cr>', 'open repo' },
            D    = { ':lua require("crates").open_documentation()<cr>', 'open documentation' },
            C    = { ':lua require("crates").open_crates_io()<cr>', 'open crates.io' },
        },
        m = {
            name = 'cmake',
            c = { '<cmd>CMake configure<cr>', 'configure' },
            r = { '<cmd>CMake run<cr>', 'run' },
            b = { '<cmd>CMake build<cr>', 'build' },
            R = { '<cmd>CMake build_and_run<cr>', 'build and run' },
            s = { '<cmd>CMake select_target<cr>', 'target' },
            t = { '<cmd>CMake select_build_type<cr>', 'build_type' },
            x = { '<cmd>CMake clean<cr>', 'clean' },
        },
        q = { '<cmd>bd<cr>', 'close current buffer' },
        w = { '<cmd>w<cr>', 'save the current buffer' },
        W = { '<cmd>wa<cr>', 'save the current buffer' },
        b = {
            c = { "<cmd>bd %<cr>", "close buffer" },
            C = { "<cmd>%bd|e#<cr>", "close all buffer" },
        },
    },
    ["<tab>"] = { "<cmd>bn<cr>", "next buffer" },
    ["<s-tab>"] = { "<cmd>bp<cr>", "prev buffer" },
})
