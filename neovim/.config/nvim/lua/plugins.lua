local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

-- Automatically install packer.nvim when it's not installed on a machine.
if fn.empty(fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use {'neovim/nvim-lspconfig', config = require'config.lsp'}
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require'config.treesitter'
  }
  use {'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = require'config.nvim-tree'
  }
  use 'tjdevries/colorbuddy.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-sleuth'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-fugitive'
  use 'wellle/targets.vim'
  use 'wadackel/vim-dogrun'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = require'config.gitsigns'
  }
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use {'hrsh7th/nvim-cmp', config = require'config.cmp'}
  use 'onsails/lspkind-nvim'
  use {'windwp/nvim-autopairs', config = require'config.autopairs'}
  use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
  use 'nvim-telescope/telescope-file-browser.nvim'
end)
