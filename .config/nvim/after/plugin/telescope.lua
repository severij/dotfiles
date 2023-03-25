local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then return end

require'telescope'.setup {
  defaults = {
    file_ignore_patterns = { '%.git' }
  }
}

local builtin = require'telescope.builtin'
local conf = require'telescope.config'.values

local dotfiles = function(opts)
  opts = opts or {}
  local home = os.getenv('HOME')
  opts.cwd = home
  opts.entry_maker = function(entry)
    local path = '~/' .. entry
    return {
      value = path,
      display = path,
      ordinal = entry
    }
  end
  require'telescope.pickers'.new(opts, {
    prompt_title = 'dotfiles',
    file_ignore_patterns = { 'zsh/plugins', 'nvim/pack/plugins' },
    finder = require'telescope.finders'.new_oneshot_job(
      {
        'git',
        '--git-dir=.dotfiles',
        '--work-tree=.',
        'ls-tree',
        '-r',
        'master',
        '--name-only',
      }, opts
    ),
    sorter = conf.generic_sorter(opts),
    previewer = conf.file_previewer(opts)
  }):find()
end

vim.keymap.set('n', '<Leader>ff', builtin.find_files)
vim.keymap.set('n', '<Leader>fg', builtin.live_grep)
vim.keymap.set('n', '<Leader>fb', function() builtin.buffers {
  ignore_current_buffer = true,
  only_cwd = true,
  sort_mru = true
} end)
vim.keymap.set('n', '<Leader>fr', builtin.oldfiles)
vim.keymap.set('n', '<Leader>fc', builtin.commands)
vim.keymap.set('n', '<Leader>f.', dotfiles)
vim.keymap.set('n', '<Leader>fh', builtin.help_tags)
vim.keymap.set('n', '<Leader>fo', builtin.colorscheme)
