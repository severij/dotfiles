return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require'telescope'.setup {
      defaults = {
        file_ignore_patterns = {
          '%.git',
          'node_modules/'
        }
      }
    }
  end
}
