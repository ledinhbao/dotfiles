return require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'

        use {
            'hoob3rt/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function() require'lualine'.setup() end
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }

        use {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function() require'nvim-tree'.setup {} end
        }
    end
)
