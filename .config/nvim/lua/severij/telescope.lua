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

return M
