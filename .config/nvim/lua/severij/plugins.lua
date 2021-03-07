cmd('packadd packer.nvim')
cmd('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function()
   use {'wbthomason/packer.nvim', opt = true}
   use {'neovim/nvim-lspconfig'}
   use {'nvim-lua/completion-nvim'}
   use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
   use {'tpope/vim-commentary'}
   use {'tpope/vim-sleuth'}
   use {'tpope/vim-surround'}
   use {'tpope/vim-unimpaired'}
   use {'tpope/vim-fugitive'}
   use {'tpope/vim-vinegar'}
   use {'wellle/targets.vim'}
   use {'junegunn/fzf', run = function() fn['fzf#install'](0) end }
   use {'junegunn/fzf.vim'}
   use {'severij/xenon'}
   use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
   }
   use {'nvim-telescope/telescope-fzy-native.nvim'}
end)
