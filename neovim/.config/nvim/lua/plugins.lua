local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require'packer'.startup(function (use)
  use {
    'wbthomason/packer.nvim',
    config = function()
      local packer = require'packer'
      vim.keymap.set('n', '<Leader>pc', packer.clean)
      vim.keymap.set('n', '<Leader>pi', packer.install)
      vim.keymap.set('n', '<Leader>pu', packer.update)
    end,
    run = 'vim.cmd[[PackerSync]]'
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    requires = {'williamboman/mason.nvim', 'neovim/nvim-lspconfig'},
    config = function() require'config.lsp' end
  }
  use {
    'L3MON4D3/LuaSnip',
    config = function() require'config.luasnip' end
  }
  use {
    'numToStr/Comment.nvim',
    config = function() require'Comment'.setup() end
  }
  use 'famiu/bufdelete.nvim'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'hrsh7th/nvim-cmp',
    config = function() require'config.cmp' end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function() require'config.telescope' end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function() require'config.lualine' end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function() require'config.nvim-tree' end
  }
  use {
    'sainnhe/everforest',
    after = 'lualine.nvim',
    config = 'vim.cmd[[colorscheme everforest]]'
  }
  use "lukas-reineke/indent-blankline.nvim"
  use {
    'TimUntersberger/neogit',
    config = function()
      local neogit = require'neogit'
      neogit.setup { integrations = { diffview = true } }
      vim.keymap.set('n', '<Leader>gg', neogit.open)
    end
  }
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      vim.keymap.set('n', '<Leader>gd', '<Cmd>DiffviewOpen<CR>')
      vim.keymap.set('n', '<Leader>gD', ':DiffviewOpen ')
      vim.keymap.set('n', '<Leader>gh', '<Cmd>DiffviewFileHistory %<CR>')
    end
  }
  use { 'lewis6991/gitsigns.nvim', config = function() require'config.gitsigns' end }
  use 'Olical/conjure'
  use {
    'ggandor/leap.nvim',
    config = function() require'leap'.add_default_mappings() end
  }
  use {'akinsho/toggleterm.nvim', config = function() require'config.toggleterm' end }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
