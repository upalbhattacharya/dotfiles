require("lazy").setup({
	-- Themes and Customization
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{ "airblade/vim-gitgutter" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "folke/lsp-colors.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{ "stevearc/aerial.nvim" },
	{ "nanozuki/tabby.nvim" },

	-- LSP-related
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "nvim-treesitter/nvim-treesitter" },
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"jose-elias-alvarez/null-ls.nvim",
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},
	{ "mbbill/undotree" },
	-- LuaSnip
	{
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},

	-- Trouble
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{ "terrortylor/nvim-comment" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "ggandor/leap.nvim" },

	{ "nvim-tree/nvim-tree.lua" },
	-- fugitive.nvim
	{ "tpope/vim-fugitive" },
	{ "sindrets/diffview.nvim" },
	-- mini.map
	{ { "echasnovski/mini.map", branch = "stable" } },
	{ "lewis6991/gitsigns.nvim" },
	-- which-key
	{ "folke/which-key.nvim" },
	--hardtime.nvim
	{ "m4xshen/hardtime.nvim" },
	-- nvim-surround
	{ "kylechui/nvim-surround" },
	{ "chentoast/marks.nvim" },
})
