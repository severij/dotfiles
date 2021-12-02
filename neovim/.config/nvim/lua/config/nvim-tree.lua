local succesful, nvim_tree = pcall(require, 'nvim-tree')
if not succesful then return end

nvim_tree.setup {
  view = {
    width = 50
  }
}
