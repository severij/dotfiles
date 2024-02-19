require 'globals'

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local options = {
  background = 'dark',
  cmdheight = 0,
  confirm = true,
  cursorline = true,
  expandtab = true,
  ignorecase = true,
  jumpoptions = 'stack',
  laststatus = 3,
  mouse = 'a',
  number = true,
  relativenumber = true,
  shiftwidth = 4,
  showmatch = true,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  undofile = true,
  winbar = '%f',
  wrap = false,
  wrapscan = false
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.keymap.set('n', '<Esc>', '<Cmd>nohl<CR><Esc>') -- Clear the search highlighting whenever <Esc> is pressed.                           

vim.cmd 'highlight WinSeparator guibg=None'
vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber | startinsert'
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
