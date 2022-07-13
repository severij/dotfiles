local load_successful, packer = pcall(require, 'packer')

-- In case packer isn't installed yet:
if not load_successful then return end

vim.keymap.set('n', '<Leader>pc', packer.clean)
vim.keymap.set('n', '<Leader>pi', packer.install)
vim.keymap.set('n', '<Leader>pu', packer.update)
