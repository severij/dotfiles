local succesful, gitsigns = pcall(require, 'gitsigns')
if not succesful then return end

gitsigns.setup()
