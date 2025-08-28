return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'zbirenbaum/copilot.lua',
    'ravitemer/mcphub.nvim'
  },
  config = function()
    require('codecompanion').setup({
      strategies = {
        chat = {
          name = 'copilot'
        },
        inline = {
          name = 'copilot'
        },
        cmd = {
          name = 'copilot'
        }
      },
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true
          }
        }
      }
    })
  end
}
