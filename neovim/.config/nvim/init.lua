require 'globals'
require 'plugins'
require 'config.keymap'

vim.cmd 'filetype plugin indent on'
vim.cmd 'syntax enable'

set_options {
  number = true,
  relativenumber = true,
  pumheight = 10,
  hidden = true,
  incsearch = true,
  hlsearch = true,
  ignorecase = true,
  smartcase = true,
  wrap = false,
  wrapscan = false,
  cursorline = true,
  backspace = 'indent,eol,start',
  sidescrolloff = 10,
  lazyredraw = true,
  history = 1000,
  termguicolors = true,
  inccommand = 'split',
  showmatch = true,
  textwidth = 100,
  colorcolumn = '+1',
  smarttab = true,
  tabstop = 8,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  splitright = true,
  splitbelow = true,
  undofile = true,
  autoindent = true,
  swapfile = false,
  directory = '.',
  equalalways = true,
  switchbuf = 'useopen,usetab',
  completeopt = 'menuone,noinsert,noselect',
  background = 'dark'
}

vim.g.seoul256_background = 235
pcall(vim.cmd, 'colorscheme seoul256')

if vim.fn.executable('rg') then
  local rg_cmd = 'rg --vimgrep'
  set_options {
    grepprg = rg_cmd,
    grepformat = '%f:%l:%c:%m'
  }
end

vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber'
