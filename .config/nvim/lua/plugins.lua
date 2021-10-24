return require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'

        use {
            'hoob3rt/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function() 
                require'lualine'.setup {
                    options = {
                        theme = 'gruvbox',
                        disabled_filetypes = { 'NvimTree' },
                    }
                }
            end
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

        use {
            'fatih/vim-go',
            run = ':GoUpdateBinaries'
        }
        use {
            'preservim/nerdtree'
        }

        use 'marko-cerovac/material.nvim'
        use 'morhetz/gruvbox'
        use 'vijaymarupudi/nvim-fzf'
    end
)
