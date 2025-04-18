return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {'nvim-treesitter/nvim-treesitter-context'},
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      highlight = { enable = true },
      ensure_installed = {
        'bash',
        'regex',
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
