local load_successful, diffview = pcall(require, 'diffview')

-- In case diffview isn't installed yet:
if not load_successful then return end

vim.keymap.set('n', '<Leader>gd', '<Cmd>DiffviewOpen<CR>')
vim.keymap.set('n', '<Leader>gh', '<Cmd>DiffviewFileHistory %<CR>')
