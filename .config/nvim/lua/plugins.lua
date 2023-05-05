return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

-- Themes and Customization
    use 'Mofiqul/dracula.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
                require'alpha'.setup(require'alpha.themes.startify'.config)
    end
    }
    use 'airblade/vim-gitgutter'
    use 'norcalli/nvim-colorizer.lua'
    use 'folke/lsp-colors.nvim'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'simrat39/symbols-outline.nvim'

-- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-treesitter/nvim-treesitter'

-- Trouble
    use {
        'folke/trouble.nvim',
      requires = "nvim-tree/nvim-web-devicons",
    }
    use 'terrortylor/nvim-comment'
    use "lukas-reineke/indent-blankline.nvim"
    use 'ggandor/leap.nvim'

    use 'nvim-tree/nvim-tree.lua'
end)

