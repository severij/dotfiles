require 'globals'

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

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
  winbar = '%f',
  jumpoptions = 'stack'
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.keymap.set('n', '<Esc>', '<Cmd>nohl<CR><Esc>') -- Clear the search highlighting whenever <Esc> is pressed.                           

vim.cmd 'highlight WinSeparator guibg=None'
vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber | startinsert'

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
