local packer_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(packer_path)) > 0 then
  cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. packer_path)
end

cmd('packadd packer.nvim')

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use {'neovim/nvim-lspconfig', config = require('config.lsp')}
  use {'nvim-lua/completion-nvim'}
--  use {
--    'nvim-treesitter/nvim-treesitter',
--    run = ':TSUpdate',
--    config = require('config.treesitter')
--  }
  if vim.fn.executable('fzf') then
    use {'junegunn/fzf.vim', config = require('config.fzf')}
  end

  use {'tpope/vim-commentary'}
  use {'tpope/vim-sleuth'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-unimpaired'}
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-vinegar'}
  use {'tpope/vim-dispatch', config = require('config.dispatch')}
  use {'wellle/targets.vim'}
  use {'mhinz/vim-sayonara'}
  use {'junegunn/seoul256.vim'}
  use {'airblade/vim-gitgutter'}
  use {'justinmk/vim-sneak'}
  use {'skywind3000/asyncrun.vim'}
end)
