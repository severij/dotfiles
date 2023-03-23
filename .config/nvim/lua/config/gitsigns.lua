local gitsigns = require'gitsigns'

gitsigns.setup {
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  current_line_blame_opts = {
    delay = 200,
    ignore_whitespace = true,
  },
  on_attach = function(bufnr)
    vim.keymap.set('n', '<Leader>gb', gitsigns.blame_line)
    vim.keymap.set('n', '<Leader>gs', gitsigns.stage_hunk)
    vim.keymap.set('n', '<Leader>gu', gitsigns.reset_hunk)
    vim.keymap.set('n', '<Leader>tb', gitsigns.toggle_current_line_blame)
    vim.keymap.set('n', '[h', gitsigns.prev_hunk)
    vim.keymap.set('n', ']h', gitsigns.next_hunk)
  end
}
