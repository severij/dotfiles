return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      highlight = { enable = true },
      ensure_installed = {
        'vimdoc',
        'luadoc',
        'vim',
        'lua',
        'markdown',
        'query'
      }
    }
  end
}
