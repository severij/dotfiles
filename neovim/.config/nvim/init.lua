require 'globals'

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
  jumpoptions = 'stack',
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
  wrap = false,
  wrapmargin = 0,
  wrapscan = false
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

 -- Clear the search highlighting and notifications whenever <Esc> is pressed.                           
vim.keymap.set('n', '<Esc>', ':nohl<CR>:lua require"notify".dismiss()<CR><Esc>')

vim.cmd 'highlight WinSeparator guibg=None'
vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber'
vim.cmd 'autocmd TextYankPost * silent! lua vim.highlight.on_yank()'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require'lazy'.setup(require'plugins', {})
