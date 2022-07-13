local load_successful, nvim_tree = pcall(require, 'nvim-tree')

-- In case nvim-tree isn't installed yet:
if not load_successful then return end

nvim_tree.setup {
  view = {
    adaptive_size = true
  }
}

-- Keymaps
vim.keymap.set('n', '<F1>', '<Cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '-', '<Cmd>NvimTreeFindFile<CR>')

