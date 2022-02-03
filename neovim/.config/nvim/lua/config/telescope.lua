local succesful, telescope = pcall(require, 'telescope')
if not succesful then return end

local themes = require'telescope.themes'
local builtin = require'telescope.builtin'
local actions = require'telescope.actions'
local action_set = require'telescope.actions.set'

-- telescope.load_extension 'file_browser'

telescope.setup {
  defaults = {
    file_ignore_patterns = { '%.git' },
    vimgrep_arguments = {'rg', '-SHn', '--color=never', '--no-heading', '--column'},
    layout_strategy = 'vertical',
    layout_config = {
      prompt_position = 'bottom',
      width = 0.85,
      height = 0.99,
      preview_cutoff = 25
    }
  }
}

vim.api.nvim_exec([[
augroup telescope
    autocmd!
    autocmd FileType TelescopePrompt inoremap <buffer> <silent> <C-r> <C-r>
augroup END]], false)

local M = {}

M.find_dotfiles = function()
  builtin.find_files {
    hidden = true,
    cwd = vim.fn.fnamemodify(
      vim.fn.system('readlink -f ~/.config/nvim/init.lua'),
      ':p:h:h:h:h'
    )
  }
end

return M
