local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
	-- pacchetti da installare

	-- init.lua:
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {style="night"},
	},
	-- per la barra in basso
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	-- per avere il linter di nusmv
	{
		'wannesm/wmnusmv.vim'
	},

	-- lazy.nvim

	--{
	--[[  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
--    "rcarriga/nvim-notify",
    }]]--
	-- } ,
	-- per autopair
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	-- per todo:
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	-- Mason e LSP
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.lsp").setup()  -- Chiama la funzione setup in lsp.lua
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
	},
	-- Autocompletamento
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",  -- Plugin per gli snippet
		},
		config = function()
			require("plugins.cmp").setup()  -- Chiama la funzione setup in cmp.lua
		end,
	},
	-- which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	-- treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			require'nvim-treesitter.configs'.setup {
				ensure_installed = { "lua", "python", "c", "cpp", "markdown" }, -- Aggiungi altri linguaggi
				highlight = { enable = true },
				indent = { enable = true },
			}
		end
	},

	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = {
			latex = {
				enabled = true,
				converter = 'pandoc',
				highlight = 'RenderMarkdownMath',
				top_pad = 0,
				bottom_pad = 0,
			},
		},
	},

	--autotag
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				filetypes = { "html", "typescriptreact", "javascriptreact" },
				-- Assicurati che "html" sia presente per i template Angular.
				-- Puoi aggiungere altri tipi di file se necessario.
			})
		end,
	}
})

require("plugins.tokyonight")
require("plugins.telescope")
require("plugins.lualine")
--require("plugins.treesitter")
--require("plugins.lsp")
--require("plugins.cmp")

