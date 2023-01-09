local toggleterm = require'toggleterm'

toggleterm.setup {
  open_mapping = [[<C-\><C-\>]],
  direction = 'float',
  shade_terminals = true,
  float_opts = {
    border = 'curved'
  }
}
