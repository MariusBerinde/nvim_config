local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

local global = vim.g
local o = vim.o
-- cambio leader da \ a <space>
global.mapleader = " "
global.maplocalleader = " "

map('n', 'ò', '{', { noremap = true })
map('n', 'à', '}', { noremap = true })


-- Mappatura di <leader>e a :e $MYVIMRC<CR> in modalità normale
map('n', '<leader><F1>', ':e $MYVIMRC<CR>', { noremap = true })

--mappatura di <leader>e per esplora cartella attuale
map('n', '<leader>e', ':Ex', { noremap = true })
-- Mappatura di <space> a za in modalità normale
--map('n', '<leader><leader>', 'za', { noremap = true })

-- Mappatura di <C-Space> a zO in modalità normale
map('n', '<C-Space>', 'zO', { noremap = true })

