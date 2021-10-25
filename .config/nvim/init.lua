vim.cmd [[ syntax on ]]
vim.cmd [[ filetype plugin on ]]

local set = vim.o
local api = vim.api
local g = vim.g

set.number = true
set.relativenumber = true
set.tabstop = 4
set.expandtab = true
set.shiftwidth = 4

require('plugins')

--vim.cmd [[ let g:gruvbox_contrast_dark='hard' ]]
g.gruvbox_contrast_dark = 'hard' 
g.gruvbox_italic = 1
vim.cmd [[ colorscheme gruvbox ]]

-- vim-go settings
g.go_highlight_function_calls = 1
g.go_highlight_types = 0
g.go_highlight_fields = 1
g.go_highlight_variable_declarations = 1

-- Settings for NvimTree
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_gitignore = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1

api.nvim_set_keymap('', '<leader>t', ':NvimTreeToggle<CR>', {})
api.nvim_set_keymap('', '<leader>r', ':NvimTreeRefresh<CR>', {})

-- Keymap for Telescope
api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true }) 
