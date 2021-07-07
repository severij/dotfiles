local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_path)
end

vim.cmd('packadd packer.nvim')

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use {'neovim/nvim-lspconfig', config = require('config.lsp')}
  use {'kyazdani42/nvim-web-devicons'}
  use {'romgrk/barbar.nvim'}
  use {'kyazdani42/nvim-tree.lua'}
  use {'nvim-lua/completion-nvim'}
  use {'junegunn/fzf.vim', config = require('config.fzf')}
  use {'junegunn/fzf', run = vim.fn['fzf#install']}
  use {'tpope/vim-commentary'}
  use {'tpope/vim-sleuth'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-unimpaired'}
  use {'tpope/vim-fugitive'}
  use {'wellle/targets.vim'}
  use {'morhetz/gruvbox'}
  use {'airblade/vim-gitgutter'}
  use {'justinmk/vim-sneak'}
end)
