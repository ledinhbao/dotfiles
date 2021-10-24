vim.cmd [[ syntax on ]]
vim.cmd [[ filetype plugin on ]]

local set = vim.o
local api = vim.api

set.number = true
set.relativenumber = true
set.tabstop = 4
set.expandtab = true
set.shiftwidth = 4

require('plugins')

vim.cmd [[ colorscheme gruvbox ]]
-- require('monokai').setup {}

-- vim-go settings
local g = vim.g
g.go_highlight_function_calls = 1
g.go_highlight_types = 0
g.go_highlight_fields = 1
g.go_highlight_variable_declarations = 1

-- Settings for NvimTree
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
api.nvim_set_keymap('', '<leader>t', ':NvimTreeToggle<CR>', {})
api.nvim_set_keymap('', '<leader>r', ':NvimTreeRefresh<CR>', {})

-- Keymap for Telescope
api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true }) 
