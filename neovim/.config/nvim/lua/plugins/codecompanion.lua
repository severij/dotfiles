return {
  'olimorris/codecompanion.nvim',
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'zbirenbaum/copilot.lua',
  },
  config = function()
    require('codecompanion').setup({
      display = {
        chat = {
          icons = {
            chat_context = "📎️",
          },
          fold_context = true,
        },
      },
      strategies = {
        chat = {
          adapter = 'copilot',
          model = "claude-sonnet-4"
        },
        inline = {
          adapter = 'copilot',
          model = "claude-sonnet-4"
        },
        cmd = {
          adapter = 'copilot',
          model = "claude-sonnet-4"
        }
      }
    })
  end
}
