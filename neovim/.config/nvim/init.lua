vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local options = {
  clipboard = 'unnamedplus',
  cmdheight = 0,
  colorcolumn = "+1",
  confirm = true,
  cursorcolumn = true,
  cursorline = true,
  equalalways = false,
  expandtab = true,
  jumpoptions = 'clean,stack',
  laststatus = 3,
  mouse = 'a',
  number = true,
  numberwidth = 1,
  relativenumber = true,
  scrolloff = 2,
  showmatch = true,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  title = true,
  timeout = true,
  timeoutlen = 300,
  undofile = true,
  updatecount = 80,
  whichwrap = '',
  winbar = '%f',
  wrap = false,
  wrapmargin = 0,
  wrapscan = false
}

for option, value in pairs(options) do
  vim.opt[option] = value
end
--
 -- Clear the search highlighting and notifications whenever <Esc> is pressed.                           
vim.keymap.set('n', '<Esc>', ':nohl<CR>:lua require"notify".dismiss()<CR><Esc>', { silent = true })

vim.cmd 'highlight WinSeparator guibg=None'
vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber'
vim.cmd 'autocmd TextYankPost * silent! lua vim.highlight.on_yank()'

require 'boot.lazy' -- Bootstrap lazy.nvim
