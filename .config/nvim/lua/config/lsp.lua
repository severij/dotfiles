lspconfig = require('lspconfig')
completion = require('completion')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)

-- Rust
lspconfig.rust_analyzer.setup{ on_attach = completion.on_attach }

-- LaTeX
lspconfig.texlab.setup{ on_attach = completion.on_attach }

-- Python
lspconfig.pylsp.setup { on_attach = completion.on_attach }

-- C/C++
lspconfig.clangd.setup{ on_attach = completion.on_attach }

-- Lua
local sumneko_root = vim.fn.expand('$HOME') ..
  '/.language-servers/lua-language-server'
local sumneko_binary = sumneko_root .. '/bin/Linux/lua-language-server'
lspconfig.sumneko_lua.setup{
  on_attach = completion.on_attach,
  cmd = { sumneko_binary, '-E', sumneko_root .. '/main.lua' },
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

set_options { omnifunc = 'v:lua.vim.lsp.omnifunc' }

-- Mappings
map {
  n = {
    ['[d'] = ':lua vim.lsp.diagnostic.goto_prev()<CR>',
    [']d'] = ':lua vim.lsp.diagnostic.goto_next()<CR>',
    ['<space><space>h'] = ':lua vim.lsp.buf.hover()<CR>',
    ['<space><space>s'] = ':lua vim.lsp.buf.signature_help()<CR>',
    ['<space><space>D'] = ':lua vim.lsp.buf.declaration()<CR>',
    ['<space><space>d'] = ':lua vim.lsp.buf.definition()<CR>',
    ['<space><space>t'] = ':lua vim.lsp.buf.type_definition()<CR>',
    ['<space><space>i'] = ':lua vim.lsp.buf.implementation()<CR>',
    ['<space><space>r'] = ':lua vim.lsp.buf.references()<CR>',
    ['<space><space>w'] = ':lua vim.lsp.buf.workspace_symbol()<CR>',
    ['<space><space>R'] = ':lua vim.lsp.buf.rename()<CR>'
  }
}
