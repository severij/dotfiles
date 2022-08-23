local load_successful, telescope = pcall(require, 'telescope')

-- In case telescope isn't installed yet:
if not load_successful then return end

local builtin = require'telescope.builtin'

telescope.setup {
  defaults = {
    file_ignore_patterns = { '%.git' }
  }
}

local function find_dotfiles()
  builtin.find_files {
    hidden = true,
    -- Not a very elegant solution but works.
    cwd = vim.fn.fnamemodify(
      vim.fn.system('readlink -f ~/.config/nvim/init.lua'),
      ':p:h:h:h:h'
    )
  }
end


vim.keymap.set('n', '<Leader>ff', builtin.find_files)
vim.keymap.set('n', '<Leader>fg', builtin.live_grep)
vim.keymap.set('n', '<Leader>fb', builtin.buffers)
vim.keymap.set('n', '<Leader>fr', builtin.oldfiles)
vim.keymap.set('n', '<Leader>fc', builtin.commands)
vim.keymap.set('n', '<Leader>f.', find_dotfiles)
