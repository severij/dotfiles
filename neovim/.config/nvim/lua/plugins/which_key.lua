return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    require'which-key'.add(require 'mappings')
  end
}
