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
  confirm = true,
  background = 'dark',
  winbar = '%f'
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.keymap.set('n', '<Esc>', '<Cmd>nohl<CR><Esc>') -- Clear the search highlighting whenever <Esc> is pressed.                           
vim.keymap.set('n', '<C-c>', '<Cmd>Bwipeout<CR>')  -- Wipeout a buffer.

vim.cmd 'highlight WinSeparator guibg=None'
vim.cmd 'colorscheme everforest'
vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber | startinsert'
