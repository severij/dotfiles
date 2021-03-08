local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
   extensions = {
      fzy_native = {
         override_generic_sorter = false,
         override_file_sorter = true,
      },
      fzf_writer = {
         minimum_grep_characters = 2,
         minimum_files_characters = 2
      }
   }
}

telescope.load_extension('fzy_native')

local home_dir = vim.loop.os_homedir()

local M = {}

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
