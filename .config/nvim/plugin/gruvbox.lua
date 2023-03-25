vim.cmd 'packadd gruvbox.nvim'

local has_gruvbox, gruvbox = pcall(require, 'gruvbox')
if not has_gruvbox then return end

gruvbox.setup()
vim.cmd 'colorscheme gruvbox'
