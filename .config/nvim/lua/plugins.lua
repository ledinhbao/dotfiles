return require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'

        use {
            'hoob3rt/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function() require'lualine'.setup() end
        }

    end
)
