local lspconfig_loaded, lspconfig = pcall(require, 'lspconfig')
local mason_loaded, mason = pcall(require, 'mason')
local mason_lspconfig_loaded, mason_lspconfig = pcall(require, 'mason-lspconfig')

if not (lspconfig_loaded and mason_loaded and mason_lspconfig_loaded) then
  return
end

mason.setup()
mason_lspconfig.setup()

-- Keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', '<Bslash>t', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', '<Bslash>a', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<Bslash>s', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<Bslash>h', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<Bslash>r', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<Bslash>f', vim.lsp.buf.formatting, opts)
vim.keymap.set('n', '<Bslash>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<Bslash>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<Bslash>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

lspconfig.sumneko_lua.setup {
  capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}

lspconfig.pylsp.setup{}

lspconfig.clojure_lsp.setup{}

lspconfig.rust_analyzer.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

lspconfig.tsserver.setup{}
