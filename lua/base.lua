local g = vim.g
local o = vim.o
local opt = vim.opt

vim.scriptencoding = "utf-8"
o.scrolloff = 8
vim.opt.path:append '**'
-- Better editor UI
o.number = true
-- o.numberwidth = 2
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true
o.autoindent = true
o.title = true
o.visualbell=true
o.showcmd = true
o.wildmenu = true
--o.shell = 'C:\Program Files\PowerShell\7\pwsh.exe'
o.shell = "pwsh.exe"
o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
o.shellxquote = ''
o.shellquote = ''
o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s'
o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s'

vim.wo.foldmethod='expr'
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()' 
--opt.foldmethod = "syntax"
-- per non creare file di backup
o.backup = false
o.swapfile = false
o.termguicolors = true
--per copiare sulla clipboard
o.clipboard = "unnamedplus"
-- setup colorscheme
--vim.cmd("colorscheme tokyonight")
--vim.cmd[[colorscheme tokyonight]]
--[[
alternative del tema
vim.cmd("colorscheme tokyonight-night") -- for night themes
vim.cmd("colorscheme tokyonight-storm") -- for storm themes
vim.cmd("colorscheme tokyonight-day") -- for day theme
vim.cmd("colorscheme tokyonight-moon") -- for moon theme
]]--
