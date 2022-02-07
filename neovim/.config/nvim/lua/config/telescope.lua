local succesful, telescope = pcall(require, 'telescope')
if not succesful then return end

local builtin = require'telescope.builtin'
local actions = require'telescope.actions'
local action_state = require'telescope.actions.state'

-- Can be used to combine picker functionality together, e.g. to start live_grep
-- within file_browser.
local open_in = function(finder)
  return function(prompt_bufnr)
    local entry_path = action_state.get_selected_entry().Path
    local path = entry_path:is_dir() and entry_path:absolute() or
                 entry_path:parent():absolute()
    actions._close(prompt_bufnr, true)
    finder { cwd = path, initial_mode = 'insert' }
  end
end

-- This action allows one cycle between the following three options:
-- * Show files and folders
-- * Show only folders
-- * Show only files
local cycle_between_show_options = function (prompt_bufnr)
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  local finder = current_picker.finder
  if finder.add_files and finder.add_dirs then
    finder.add_files = false
  elseif finder.add_dirs then
    finder.add_files = true
    finder.add_dirs = false
  else
    finder.add_dirs = true
  end
  current_picker:refresh(finder, {
    reset_prompt = true,
    multi = current_picker._multi
  })
end

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
  },
  extensions = {
    file_browser = {
      layout_strategy = 'horizontal',
      mappings = {
        i = {
          ["<c-f>"] = cycle_between_show_options,
          ["<a-f>"] = open_in(builtin.find_files),
          ["<C-Space>"] = open_in(builtin.live_grep),
        },
      }
    }
  }
}

pcall(telescope.load_extension, 'file_browser')

vim.api.nvim_exec([[
augroup telescope
    autocmd!
    autocmd FileType TelescopePrompt inoremap <buffer> <silent> <C-r> <C-r>
augroup END]], false)

local M = {}

M.find_dotfiles = function()
  builtin.find_files {
    hidden = true,
    -- Not a very elegant solution but works.
    cwd = vim.fn.fnamemodify(
      vim.fn.system('readlink -f ~/.config/nvim/init.lua'),
      ':p:h:h:h:h'
    )
  }
end

return M
