local load_succesful, neogit = pcall(require, 'neogit')

-- In case Neogit isn't installed yet:
if not load_succesful then return end

neogit.setup {
  integrations = {
    diffview = true
  }
}

vim.keymap.set('n', '<Leader>gg', neogit.open)
