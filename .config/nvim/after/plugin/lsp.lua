local has_lspconfig, lspconfig = pcall(require, 'lspconfig')
if not has_lspconfig then return end

local has_mason, mason = pcall(require, 'mason')
if has_mason then mason.setup() end
local has_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
if has_mason_lspconfig then mason_lspconfig.setup() end


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
vim.keymap.set({'n', 'v'}, '<Bslash>f', vim.lsp.buf.format, opts)
vim.keymap.set('n', '<Bslash>wa', vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set('n', '<Bslash>wr', vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set('n', '<Bslash>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = {'vim'} },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      telemetry = { enable = false },
    },
  },
}

lspconfig.pylsp.setup{}

lspconfig.clojure_lsp.setup{}

lspconfig.rust_analyzer.setup {}

lspconfig.tsserver.setup{}
