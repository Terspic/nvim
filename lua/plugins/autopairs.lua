local ok, npairs = pcall(require, 'nvim-autopairs')
if not ok then
    return
end

npairs.setup({})
local Rule = require('nvim-autopairs.rule')
npairs.add_rule(Rule("/*", "*/", { 'c', 'cpp' }))
