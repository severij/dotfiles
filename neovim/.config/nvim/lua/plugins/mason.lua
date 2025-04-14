return {
  'williamboman/mason.nvim',
  dependencies = {
    'nvim-neotest/nvim-nio'
  },
  lazy = false,
  config = function()
    require'mason'.setup()
  end
}
