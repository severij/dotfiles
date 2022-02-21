local succesful, lspconfig = pcall(require, 'lspconfig')
if not succesful then return end

local capabilities = require'cmp_nvim_lsp'.update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)

-- Rust
lspconfig.rust_analyzer.setup{ capabilities = capabilities }

-- -- LaTeX
lspconfig.texlab.setup{ capabilities = capabilities }

-- -- Python
lspconfig.pylsp.setup{ capabilities = capabilities }

-- -- C/C++
lspconfig.clangd.setup{ capabilities = capabilities }

-- Lua
local sumneko_root = '/usr/share/lua-language-server/'
local sumneko_binary = '/usr/bin/lua-language-server'
lspconfig.sumneko_lua.setup{
  capabilities = capabilities,
  cmd = { sumneko_binary, '-E', sumneko_root .. 'main.lua' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';')
      },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      }
    }
  }
}

vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.lsp.diagnostic.goto_next)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gI', vim.lsp.buf.implementation)
vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', '<Leader>rr', vim.lsp.buf.rename)
vim.keymap.set('n', '<Ctrl-h>', vim.lsp.buf.hover)
vim.keymap.set('n', '<Leader>w', vim.lsp.buf.workspace_symbol)

set_options { omnifunc = 'v:lua.vim.lsp.omnifunc' }
