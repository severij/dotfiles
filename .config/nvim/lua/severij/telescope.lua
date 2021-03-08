local action_state = require('telescope.actions.state')
local actions = require('telescope.actions')
local finders = require('telescope.finders')

local M = {}
local home_dir = vim.loop.os_homedir()

M.dotfiles = function()
  require('telescope.builtin').find_files {
    cwd = home_dir,
    find_command = {
      'git', '--git-dir', home_dir .. '/.dotfiles/', '--work-tree', home_dir,
      'ls-tree', '--full-tree', '-r', '--name-only', 'HEAD'
    }
  }
end

M.buffers = function()
  require('telescope.builtin').buffers {
    attach_mappings = function(prompt_bufnr, map)
      local delete_buf = function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.api.nvim_buf_delete(selection.bufnr, { force = false })
      end
      map('n', 'd', delete_buf)
      return true
    end
  }
end

return M
