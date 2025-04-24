return {
  'kylechui/nvim-surround',
  version = '*',
  event = 'VeryLazy',
  config = function() require('nvim-surround').setup {
    keymaps = {
      insert = '<C-g>s',
      insert_line = '<C-g>S',
      normal = 'ys',
      normal_cur = 'yss',
      normal_line = 'yS',
      normal_cur_line = 'SS',
      visual = 'ys',
      visual_line = 'yS',
      delete = 'ds',
      change = 'cs'
      }
  } end
}
