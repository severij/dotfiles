require('globals')
require('plugins')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')

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
  textwidth = 100,
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

set_global_vars {
  mapleader = ' ',
  nvim_tree_width = 60,
  ['sneak#label'] = 1,
  ['sneak#use_ic_scs'] = 1,
  bufferline = {
    animation = false,
    auto_hide = true,
    closable = false,
    icons = false,
    maximum_padding = 1,
    maximum_length = 40
  },
  fzf_preview_window = {'down:50%', 'ctrl-/'},
  fzf_layout = { window = { width = 0.95, height = 0.9 } }
}

if vim.fn.executable('rg') then
  local rg_cmd = 'rg --vimgrep'
  set_options {
    grepprg = rg_cmd,
    grepformat = '%f:%l:%c:%m'
  }
end

 map {
   n = {
     ['<leader>ff']    = ':Files<CR>',
     ['<leader>fG']    = ':Rg<CR>',
     ['<leader>fb']    = ':Buffers<CR>',
     ['<leader>f.']    = ':Dotfiles<CR>',
     ['[h']            = ':GitGutterPrevHunk<CR>',
     [']h']            = ':GitGutterNextHunk<CR>',
     ['<leader>gg']    = ':Git<CR>',
     ['<leader>gb']    = ':Git blame<CR>',
     ['<leader>gl']    = ':Git log<CR>',
     ['<C-s>']         = ':BufferPick<CR>',
     ['<leader>bd']    = ':BufferClose<CR>',
     ['<leader><Tab>'] = ':NvimTreeToggle<CR>',
     ['-']             = ':NvimTreeFindFile<CR>',
     ['<C-space>']     = ':set bufhidden=hide<CR>',
     ['<leader>1']     = ':BufferGoto 1<CR>',
     ['<leader>2']     = ':BufferGoto 2<CR>',
     ['<leader>3']     = ':BufferGoto 3<CR>',
     ['<leader>4']     = ':BufferGoto 4<CR>',
     ['<leader>5']     = ':BufferGoto 5<CR>',
     ['<leader>6']     = ':BufferGoto 6<CR>',
     ['<leader>7']     = ':BufferGoto 7<CR>',
     ['<leader>8']     = ':BufferGoto 8<CR>',
     ['<leader>9']     = ':BufferGoto 9<CR>'
   }
 }
 
map({ n = {
  ['<LEADER>fF'] = ':Files ',
  ['<leader>fg']    = ':Rg '
}}, {silent = false})

vim.cmd('autocmd TermOpen * setlocal nonumber')
vim.cmd('autocmd BufReadPost * set bufhidden=delete')
