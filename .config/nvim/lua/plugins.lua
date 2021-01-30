cmd('packadd packer.nvim')
cmd('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function()
   use {'wbthomason/packer.nvim', opt = true}
   use {'neovim/nvim-lspconfig'}
   use {'nvim-lua/completion-nvim'}
   use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
   }
   use {'tpope/vim-commentary'}
   use {'tpope/vim-sleuth'}
   use {'tpope/vim-surround'}
   use {'tpope/vim-unimpaired'}
   use {'tpope/vim-fugitive'}
   use {'tpope/vim-vinegar'}
   use {'wellle/targets.vim'}
   use {'justinmk/vim-sneak'}
   use {'junegunn/fzf.vim'}
   use {'morhetz/gruvbox'}
   use {'vim-airline/vim-airline'}
-- Plug 'tpope/vim-sensible'
-- Plug 'kassio/neoterm'
-- Plug 'autozimu/LanguageClient-neovim', {
--     \ 'branch': 'next',
--     \ 'do': 'bash install.sh',
--     \ }
end)
