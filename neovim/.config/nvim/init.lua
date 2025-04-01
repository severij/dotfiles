vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local options = {
  clipboard = 'unnamedplus',
  cmdheight = 0,
  colorcolumn = "+1",
  confirm = true,
  cursorcolumn = true,
  cursorline = true,
  equalalways = false,
  expandtab = true,
  jumpoptions = 'clean,stack',
  laststatus = 3,
  mouse = 'a',
  number = true,
  numberwidth = 1,
  relativenumber = true,
  scrolloff = 2,
  showmatch = true,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  title = true,
  timeout = true,
  timeoutlen = 300,
  undofile = true,
  updatecount = 80,
  whichwrap = '',
  wrap = false,
  wrapmargin = 0,
  wrapscan = false
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

 -- Clear the search highlighting and notifications whenever <Esc> is pressed.                           
vim.keymap.set('n', '<Esc>', ':nohl<CR>:lua Snacks.notifier.hide()<CR><Esc>')

vim.cmd 'highlight WinSeparator guibg=None'
vim.cmd 'autocmd TermOpen * setlocal nonumber norelativenumber'
vim.cmd 'autocmd TextYankPost * silent! lua vim.highlight.on_yank()'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = 'plugins' }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
