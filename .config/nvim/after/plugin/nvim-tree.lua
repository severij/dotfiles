local has_nvim_tree, nvim_tree = pcall(require, 'nvim-tree')
if not has_nvim_tree then return end

nvim_tree.setup {
  view = {
    adaptive_size = true
  },
  sync_root_with_cwd = true,
  respect_buf_cwd = true
}

local api = require('nvim-tree.api')

-- Keymaps
vim.keymap.set('n', '<F1>', '<Cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '-', function()
  if vim.api.nvim_buf_get_name(0) then
    api.tree.toggle(true)
  else
    api.tree.open(vim.fn.getcwd())
  end
end)

