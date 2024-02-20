require'mason'.setup()
require'neodev'.setup()

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
