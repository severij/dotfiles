vim.g.mapleader = ' '

require'plugins'

vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.number = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.directory = '.'
vim.opt.background = 'dark'

-- Clear the search highlighting whenever <Esc> is pressed.                           
vim.keymap.set('n', '<Esc>', '<Cmd>nohl<CR><Esc>')

vim.cmd 'highlight WinSeparator guibg=None'

vim.cmd 'colorscheme everforest'
