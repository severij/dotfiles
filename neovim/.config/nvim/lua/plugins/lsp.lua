return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.enable({'clojure_lsp', 'lua_ls', 'pylsp', 'tsserver'})
  end
}
