require('globals')
require('plugins')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')


local buf_wipe_interval = 180000 -- in milliseconds
local time_since_modified_threshold = 1800 -- in seconds

local timer = vim.loop.new_timer()
timer:start(buf_wipe_interval, buf_wipe_interval, vim.schedule_wrap(function()
  for _,buf in ipairs(vim.fn['getbufinfo']()) do
    local time_since_modified =
        vim.fn['localtime']() - vim.fn['getftime'](buf.name)
    if buf.hidden == 1 and buf.changed == 0 and 
        not buf.variables.term_title and not vim.b.keep_open and
        time_since_modified > time_since_modified_threshold then
      vim.api.nvim_buf_delete(buf.bufnr, {})
    end
  end
end))

set_options {
  number = true,
  relativenumber = true,
  hidden = true,
  incsearch = true,
  hlsearch = true,
  ignorecase = true,
  smartcase = true,
  wrapscan = false,
  cursorline = true,
  backspace = 'indent,eol,start',
  sidescrolloff = 10,
  lazyredraw = true,
  history = 1000,
  termguicolors = true,
  pumblend = 15,
  winblend = 15,
  inccommand = 'split',
  showmatch = true,
  textwidth = 80,
  colorcolumn = '+1',
  smarttab = true,
  expandtab = true,
  tabstop = 4,
  shiftwidth = 4,
  mouse = 'a',
  splitright = true,
  splitbelow = true,
  undofile = true,
  autoindent = true,
  directory = '.',
  equalalways = true,
  switchbuf = 'useopen,usetab',
  completeopt = 'menuone,noinsert,noselect',
  background = 'dark'
}

vim.cmd('colorscheme gruvbox')

vim.g['sneak#label'] = 1
vim.g['sneak#use_ic_scs'] = 1

if vim.fn.executable('rg') then
  local rg_cmd = 'rg --vimgrep'
  set_options {
    grepprg = rg_cmd,
    grepformat = '%f:%l:%c:%m'
  }
end

vim.g.mapleader = ' '

 map {
   n = {
     ['<leader>bk']    = ':lua vim.b.keep_open = true<CR>',
     ['<leader>ff']    = ':Files<CR>',
     ['<leader>fb']    = ':Buffers<CR>',
     ['<leader>f.']    = ':Dotfiles<CR>',
     ['<leader>bd']    = ':Sayonara!<CR>',
     ['<leader>bD']    = ':Sayonara<CR>',
     ['[h']            = ':GitGutterPrevHunk<CR>',
     [']h']            = ':GitGutterNextHunk<CR>',
     ['<leader>gg']    = ':Git<CR>',
     ['<leader>gb']    = ':Git blame<CR>',
     ['<leader>gl']    = ':Git log<CR>',
     ['<leader><Tab>'] = ':NvimTreeToggle<CR>',
     ['-']             = ':NvimTreeFindFile<CR>'
   }
 }
 
 map({ n = {
   ['<LEADER>fF'] = ':Files ',
   ['<LEADER>fg'] = ':Grep ',
 }}, {silent = false})

vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
