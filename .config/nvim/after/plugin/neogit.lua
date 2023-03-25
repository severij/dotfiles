local has_neogit, neogit = pcall(require, 'neogit')
if not has_neogit then return end

neogit.setup { integrations = { diffview = true } }
vim.keymap.set('n', '<Leader>gg', neogit.open)
