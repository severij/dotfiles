local succesful, telescope = pcall(require, 'telescope')
if not succesful then return end

local themes = require'telescope.themes'
local builtin = require'telescope.builtin'
local actions = require'telescope.actions'
local action_set = require'telescope.actions.set'

telescope.load_extension 'file_browser'

telescope.setup {
  defaults = {
    file_ignore_patterns = { '%.git' },
    vimgrep_arguments = {'rg', '-SHn', '--color=never', '--no-heading', '--column'}
  }
}

vim.api.nvim_exec([[
augroup telescope
    autocmd!
    autocmd FileType TelescopePrompt inoremap <buffer> <silent> <C-r> <C-r>
augroup END]], false)

local overwrite_options = function(default_options, options)
  return vim.tbl_extend('force', default_options, options)
end

local M = {}

local default_options = {
  layout_strategy = 'vertical',
  winblend = 15,
  layout_config = {
    prompt_position = 'bottom',
    width = 0.85,
    height = 0.99,
    preview_cutoff = 25 
  }
}

M.find_files = function(options)
  local options = options or {}
  builtin.find_files(overwrite_options(default_options, options))
end

M.live_grep = function(options)
  local options = options or {}
  builtin.live_grep(overwrite_options(default_options, options))
end

M.buffers = function()
  builtin.buffers(default_options)
end

M.find_dotfiles = function()
  builtin.find_files(overwrite_options(default_options, {
    hidden = true,
    cwd = vim.fn.fnamemodify(
      vim.fn.system('readlink -f ~/.config/nvim/init.lua'),
      ':p:h:h:h:h'
    )
  }))
end

return M
