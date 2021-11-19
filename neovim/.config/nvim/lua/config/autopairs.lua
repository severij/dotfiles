local succesful, autopairs = pcall(require, 'nvim-autopairs')
if not succesful then return end

autopairs.setup()
