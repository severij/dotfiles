return {
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
    require'mason'.setup()
    require'dapui'.setup()

    local mason_lspconfig = require'mason-lspconfig'
    local lspconfig = require'lspconfig'

    mason_lspconfig.setup()
    mason_lspconfig.setup_handlers {
      function(server_name)
        lspconfig[server_name].setup {}
      end,
      lua_ls = function()
        lspconfig.lua_ls.setup({
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace"
              }
            }
          }
        })
      end
    }
  end
}
