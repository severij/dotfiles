local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

-- Automatically install packer.nvim when it's not installed on a machine.
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd 'packadd packer.nvim'

local packer = require'packer'
local use = packer.use

return packer.startup(function ()
  use {'wbthomason/packer.nvim', config = require'config.packer'}

  use {'neovim/nvim-lspconfig', config = require'config.lsp'}
  use {'L3MON4D3/LuaSnip', config = require'config.luasnip'}
  use {'numToStr/Comment.nvim', config = require'config.Comment'}
  use 'famiu/bufdelete.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use {'hrsh7th/nvim-cmp', config = require'config.cmp'}

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = require'config.telescope'
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require'config.lualine'
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = require'config.nvim-tree'
  }
  use 'sainnhe/everforest'
  use "lukas-reineke/indent-blankline.nvim"
  use { 'TimUntersberger/neogit', config = require'config.neogit' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim', config = require'config.diffview' }
  use { 'lewis6991/gitsigns.nvim', config = require'config.gitsigns' }
  use 'Olical/conjure'
  use 'https://github.com/mg979/vim-visual-multi'
end)
