local packer_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(packer_path)) > 0 then
  cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_path)
end

cmd('packadd packer.nvim')

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use {'neovim/nvim-lspconfig', config = require('config.lsp')}
  use {'nvim-lua/completion-nvim'}
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require('config.treesitter')
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = require('config.telescope')
  }
  use {'nvim-telescope/telescope-fzy-native.nvim'}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-sleuth'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-unimpaired'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-vinegar'}
  use {'wellle/targets.vim'}
  use {'severij/xenon'}
end)
