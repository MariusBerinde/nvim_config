vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.cmd([[
    function! OpenPowerShell()
        call termopen(['C:\Program Files\PowerShell\7\pwsh.exe'])
        startinsert
    endfunction

    command! Powershell call OpenPowerShell()
]])
require ("base") -- set generali
require ("maps") -- set mapping
require("plugins.lazy")

--require('lualine').get_config(
--vim.opt.conceallevel = 2
