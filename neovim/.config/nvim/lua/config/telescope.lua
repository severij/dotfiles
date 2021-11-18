local telescope = require'telescope'
local themes = require'telescope.themes'
local builtin = require'telescope.builtin'

telescope.setup {
  defaults = {
    vimgrep_arguments = {'rg', '-SHn', '--color=never', '--no-heading', '--column'}
  }
}

local M = {}

local opts = {
  layout_strategy = 'vertical',
  winblend = 15,
  layout_config = {
    prompt_position = 'bottom',
    width = 0.85,
    height = 0.99,
    preview_cutoff = 25 
  }
}

M.find_files = function(find_within_dir)
  local opts = opts
  if find_within_dir then
    opts.cwd = vim.fn.input {
      prompt = 'Which directory? ',
      completion = 'dir',
      cancelreturn = '.'
    }
    if opts.cwd == '' then opts.cwd = '.' end
  end
  builtin.find_files(opts)
end

M.live_grep = function()
  builtin.live_grep(opts)
end

M.buffers = function()
  builtin.buffers(opts)
end

M.find_dotfiles = function()
  builtin.find_files(vim.tbl_extend('force', opts, {
    hidden = true,
    cwd = vim.fn.fnamemodify(
      vim.fn.system('readlink -f ~/.config/nvim/init.lua'),
      ':p:h:h:h:h'
    )
  }))
end

return M
