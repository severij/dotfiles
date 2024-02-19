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
    config = function() require'config.treesitter' end
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter'
  },
  {
    'williamboman/mason.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason-lspconfig.nvim'
    },
    lazy = false,
    config = function() require'config.lsp' end
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
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function() require'config.mappings' end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
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
  {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function() require'Comment'.setup() end
  },
  {
    'famiu/bufdelete.nvim'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function()
      require'lualine'.setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {},
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        extensions = {}
      }
    end
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
      'folke/neodev.nvim'
  },
  -- currently experimenting with the plugins below
  {
      'rcarriga/nvim-notify',
      config = function() vim.notify = require'notify' end
  },
  {
      'stevearc/oil.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function() require'oil'.setup() end
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function() require'nvim-autopairs'.setup() end
  },
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
  'Olical/conjure',
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
  }
}
