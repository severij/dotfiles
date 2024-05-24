return {
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme gruvbox')
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = true
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() require'oil'.setup() end
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason-lspconfig.nvim',
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio'
    },
    lazy = false,
    config = function()
      require'config.lsp'
      require'dapui'.setup()
    end
  },
  {
    'tpope/vim-sleuth',
    lazy = false
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require'ibl'.setup() end
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function() require'config.mappings' end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require'telescope'.setup {
        defaults = {
          file_ignore_patterns = {
            '%.git',
            'node_modules/'
          }
        }
      }
    end
  },
  {
    'sindrets/diffview.nvim',
    config = function()
      require'diffview'.setup {
        default_args = {
          DiffviewOpen = { '--imply-local' },
        }
      }
    end
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'sindrets/diffview.nvim',
    },
    config = true
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    config = function()
      require 'gitsigns'.setup {
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        current_line_blame_opts = {
          delay = 200,
          ignore_whitespace = true
        }
      }
    end
  },
  'famiu/bufdelete.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = true
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'PaterJason/cmp-conjure'
    },
    config = function() require'config.cmp' end
  },
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
  },
  {
      'rcarriga/nvim-notify',
      config = function() vim.notify = require'notify' end
  },
  'Olical/conjure',
  -- currently experimenting with the plugins below
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function() require('nvim-surround').setup {
      keymaps = {
        insert = '<C-g>s',
        insert_line = '<C-g>S',
        normal = 's',
        normal_cur = 'ss',
        normal_line = 'S',
        normal_cur_line = 'SS',
        visual = 's',
        visual_line = 'S',
        delete = 'ds',
        change = 'cs'
        }
    } end
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = true
  }
}
