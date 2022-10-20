vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require'plugins'

local options = {
  termguicolors = true,
  laststatus = 3,
  number = true,
  wrap = false,
  wrapscan = false,
  expandtab = true,
  shiftwidth = 4,
  ignorecase = true,
  smartcase = true,
  cursorline = true,
  showmatch = true,
  splitright = true,
  splitbelow = true,
  mouse = 'a',
  undofile = true,
  directory = '.',
  confirm = true,
  background = 'dark',
  winbar = '%f'
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.keymap.set('n', '<Esc>', '<Cmd>nohl<CR><Esc>') -- Clear the search highlighting whenever <Esc> is pressed.                           
vim.keymap.set('n', '<C-c>', '<Cmd>Bwipeout<CR>')  -- Wipeout a buffer.
vim.keymap.set('n', '<C-j>', 'ddpgqq')  -- Move a line upwards and format it.
vim.keymap.set('n', '<C-k>', 'ddkPgqq') -- Move a line downwards and format it.
vim.keymap.set('x', '<C-j>', ":m'>+<CR>gv=gv") -- Move selected lines upwards and format them.
vim.keymap.set('x', '<C-k>', ":m-2<CR>gv=gv")  -- Move selected lines downwards and format them.

vim.cmd 'highlight WinSeparator guibg=None'
vim.cmd 'colorscheme everforest'
vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber | startinsert'
