local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- PLUGINS
local plugins = {
	--          [Themes]
	{ "ellisonleao/gruvbox.nvim", priority = 500 },
	{ "water-sucks/darkrose.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{ "rose-pine/neovim", name = "rose-pine", priority = 1000 },
	{ "catppuccin/nvim" },
	{ "davidosomething/vim-colors-meh" },
	{ "rebelot/kanagawa.nvim" },
	{ "projekt0n/github-nvim-theme" },
	{ "akinsho/horizon.nvim", version = "*" },

	--      [startup page]
	{ "goolord/alpha-nvim" },

	--        [nvim tree]
	"nvim-tree/nvim-tree.lua",

	--        [Undo Tree]
	"mbbill/undotree",

	--      [Web devicons]
	"nvim-tree/nvim-web-devicons",
	--      [treesitter]
	{
		{
			"nvim-treesitter/nvim-treesitter",
			dependencies = {
				{ "windwp/nvim-ts-autotag" },
				-- { "HiPhish/nvim-ts-rainbow2" },
			},
			build = ":TSUpdate",
		},
	},
	--lua line
	"nvim-lualine/lualine.nvim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.3",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	-- Lsp : lsp-zero
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },

	-- completion nvim-cmp
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" }, -- Required
	{ "hrsh7th/cmp-buffer" }, -- Optional
	{ "hrsh7th/cmp-path" }, -- Optional
	{ "hrsh7th/cmp-nvim-lua" }, -- Optional
	{ "hrsh7th/cmp-nvim-lsp-signature-help" }, -- Optional
	{ "hrsh7th/cmp-vsnip" }, -- Optional
	{ "saadparwaiz1/cmp_luasnip" }, -- Optional
	{ "L3MON4D3/LuaSnip" }, -- Required
	{ "rafamadriz/friendly-snippets" }, -- Optional
	-- Formatter : null-ls
	{ "jose-elias-alvarez/null-ls.nvim" },
	-- Mason for auto config
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- [Snippets Icons]
	"onsails/lspkind-nvim", -- vscode like pictograms
	"nvimdev/lspsaga.nvim", -- LSP UIs

	--      [conform nvim]
	{ "stevearc/conform.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },

	--      [nvim lint]
	-- { "mfussenegger/nvim-lint", event = { "BufReadPre", "BufNewFile" } },

	--      [autopairs]
	{ "windwp/nvim-autopairs", event = "InsertEnter" },

	--          [Git]
	"lewis6991/gitsigns.nvim", -- gitsigns
	"tpope/vim-fugitive", -- fugitive
	"tpope/vim-rhubarb",

	--      [MarkdownPreview]
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	--      [Discord presence]
	{ "andweeb/presence.nvim" },

	--      [lsp_signature]
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
	},

	--      [vim cool]
	{ "romainl/vim-cool" },

	--      [Live-server]
	{
		"aurum77/live-server.nvim",
		build = function()
			require("live_server.util").install()
		end,
		cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
	},

	--      [colorizer]
	{ "norcalli/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" } },

	--      [Transparent - allows for toggle]
	{ "xiyaowong/nvim-transparent" },

	--      [diffview]
	{ "sindrets/diffview.nvim" },

	--      [Vgit]
	{
		"tanvirtin/vgit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	--   [Terminal in the floating/popup window.]
	"akinsho/toggleterm.nvim",

	--      [Wilder]
	"gelguy/wilder.nvim",

	--      [Smoothie]
	"psliwka/vim-smoothie",

	--  [Add indentation guides on even blank lines]
	{ "lukas-reineke/indent-blankline.nvim" },

	--      [Whick key]
	{ "folke/which-key.nvim", event = "VeryLazy" },

	--      [commentry]
	"tpope/vim-commentary",

	--      [Vim Tex]
	"lervag/vimtex",

	--      [zen]
	"folke/zen-mode.nvim",

	--      [Fidget]
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
		},
	},

	-- npm packages
	{
		"David-Kunz/cmp-npm",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "json",
		config = function()
			require("cmp-npm").setup({})
		end,
	},

	-- rust packages
	{
		"saecki/crates.nvim",
		tag = "v0.4.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup({
				-- src = {
				-- 	cmp = {
				-- 		enabled = true,
				-- 	},
				-- },
			})
		end,
	},
	-- auto completion for css in html
	{
		"Jezda1337/nvim-html-css",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("html-css"):setup()
		end,
	},

	-- auto save
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({})
		end,
	},

	-- pywal colors
	{ "AlphaTechnolog/pywal.nvim" },
}

-- PLUGINS
local opts = {}
require("lazy").setup({ plugins, opts }, {
	checker = {
		enabled = true,
		notify = false,
	},
})
