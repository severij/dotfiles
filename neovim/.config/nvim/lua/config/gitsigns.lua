local load_successful, gitsigns = pcall(require, 'gitsigns')

-- In case gitsigns isn't installed yet:
if not load_successful then return end

gitsigns.setup {
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  current_line_blame_opts = {
    delay = 200,
    ignore_whitespace = true,
  },
  on_attach = function(bufnr)
    vim.keymap.set('n', '<Leader>gb', gitsigns.blame_line)
    vim.keymap.set('n', '<Leader>tb', gitsigns.toggle_current_line_blame)
  end
}
