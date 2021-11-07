local use = require('packer').use
require('packer').startup(
    function() 
        use 'wbthomason/packer.nvim'
        use {
            'neovim/nvim-lspconfig',
        }
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
            config = function() 
                require'nvim-tree'.setup {
                    view = {
                        auto_resize = true,
                    }
                
                } 
            end
        }

        use {
            'fatih/vim-go',
            run = ':GoUpdateBinaries'
        }

        use 'marko-cerovac/material.nvim'
        use 'morhetz/gruvbox'
        use 'vijaymarupudi/nvim-fzf'
        use 'ap/vim-css-color'
        use {
            'nvim-telescope/telescope.nvim',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }
        use 'tpope/vim-commentary'
        use 'tpope/vim-fugitive'
        use 'mkitt/tabline.vim'
        use 'dense-analysis/ale'
        use 'jiangmiao/auto-pairs'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'saadparwaiz1/cmp_luasnip'
        use 'L3MON4D3/LuaSnip'
    end
)

-- This follow instruction at https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- Add additional capabilities support by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local nvim_lsp = require('lspconfig')
local servers = { 'gopls' } 
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- Set completeopt to have better experience.
vim.o.completeopt = 'menuone,noselect'
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    mapping = {
        ['<C-space]'] = cmp.mapping.complete(),
        ['<C-e'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    },
}
