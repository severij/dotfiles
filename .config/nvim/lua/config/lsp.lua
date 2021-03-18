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

-- Python
lspconfig.pyls.setup{ on_attach = completion.on_attach }

-- LaTeX
lspconfig.texlab.setup{ on_attach = completion.on_attach }

-- C/C++
lspconfig.clangd.setup{
  on_attach = completion.on_attach,
  cmd = {
    'clangd-10',
    '--background-index'
    -- '--compile-commands-dir=/home/<username>/...
  }
  -- root_dir = lspconfig.util.root_pattern(
  --    '/home/<username>/path/to/compile_commands.json
  --    '.git'
  -- )
}

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

opt('b', 'omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings
map {
  n = {
    ['[d'] = ':lua vim.lsp.diagnostic.goto_prev()<CR>',
    [']d'] = ':lua vim.lsp.diagnostic.goto_next()<CR>',
    ['K'] = ':lua vim.lsp.buf.hover()<CR>',
    ['gD'] = ':lua vim.lsp.buf.declaration()<CR>',
    ['gd'] = ':lua vim.lsp.buf.definition()<CR>',
    ['gi'] = ':lua vim.lsp.buf.implementation()<CR>',
    ['gr'] = ':lua vim.lsp.buf.references()<CR>',
    ['<LEADER>rr'] = ':lua vim.lsp.buf.rename()<CR>'
  }
}
