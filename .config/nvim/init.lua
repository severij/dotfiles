require('globals')
require('plugins')

cmd('filetype plugin indent on')
cmd('syntax enable')

-- Line numbers on always.
vim.o.number, vim.wo.number = true, true

-- Also enable relative line numbers for easy vertical movement. Sometimes this
-- can be quite confusing for colleagues not used to vim, so it can also be
-- toggled with the `yor` mapping provided by vim-unimpaired.
vim.o.relativenumber, vim.wo.relativenumber = true, true

-- Enable hidden buffers. This is quite crucial and I recommend this to
-- everybody.
vim.o.hidden = true

-- However, I often notice that I have way too many buffers open. This
-- automatically deletes unneeded buffers once in every three minutes.
local buf_wipe_interval = 180000 -- in milliseconds
local time_since_modified_threshold = 1800 -- in seconds

local timer = vim.loop.new_timer()
timer:start(buf_wipe_interval, buf_wipe_interval, vim.schedule_wrap(function()
  for _,buf in ipairs(vim.fn['getbufinfo']()) do
    local time_since_modified =
        vim.fn['localtime']() - vim.fn['getftime'](buf.name)
    if buf.hidden == 1 and buf.changed == 0 and
        time_since_modified > time_since_modified_threshold then
      vim.api.nvim_buf_delete(buf.bufnr, {})
    end
  end
end))

-- This is nice, since it allows you to notice a typo early on.
vim.o.incsearch = true

-- Sometimes this is useful, but most often just annoying, so it's disabled by
-- default. I tend to use `yoh` mapping provided in vim-unimpaired to toggle
-- this option.
vim.o.hlsearch = false

-- I like to keep this off, so I'll get a lot less unintented matches and it
-- keeps me misusing the search functionaly. However, sometimes this is very
-- useful, so I use the `yoi` mapping provided in vim-unimpaired to toggle this.
vim.o.ignorecase = false

-- Disable wrapscan, since more often this is just confusing.
vim.o.wrapscan = false

opt('o', 'backspace', 'indent,eol,start')
opt('o', 'sidescrolloff', 10)
opt('o', 'lazyredraw', true)
opt('o', 'history', 1000)
-- opt('o', 'termguicolors', true)
-- opt('o', 'pumblend', 15)
-- opt('o', 'winblend', 15)
opt('o', 'cursorline', true)
opt('o', 'inccommand', 'split')
opt('o', 'showmatch', true)
opt('w', 'relativenumber', true)
opt('o', 'smartcase', true)
opt('b', 'textwidth', 80)
opt('w', 'colorcolumn', '+1')
opt('o', 'smarttab', true)
opt('b', 'expandtab', true)
opt('b', 'tabstop', 4)
opt('b', 'shiftwidth', 4)
opt('o', 'mouse', 'a')
opt('o', 'splitright', true)
opt('o', 'splitbelow', true)
opt('o', 'undofile', true)
opt('b', 'autoindent', true)
opt('o', 'directory', '.')
opt('o', 'equalalways', true)
opt('o', 'listchars', 'tab:-->,trail:.,eol:$,extends:>,precedes:<,nbsp:~')
opt('o', 'switchbuf', 'useopen,usetab')
opt('o', 'completeopt', 'menuone,noinsert,noselect')

vim.cmd('colorscheme seoul256')
opt('o', 'background', 'dark')

vim.g['sneak#label'] = 1

if fn.executable('rg') then
  opt('o', 'grepprg', 'rg --vimgrep')
  opt('o', 'grepformat', '%f:%l:%c:%m')
end

vim.g.mapleader = ' '

run_grepprg = function(pattern, path, ...)
  local path = path or '.'
  local args = ""
  for _,arg in ipairs{...} do
    args = args .. ' ' .. arg
  end
  local old_makeprg = vim.o.makeprg
  local old_errorformat = vim.o.errorformat
  vim.o.makeprg = vim.o.grepprg
  vim.o.errorformat = vim.o.grepformat
  vim.api.nvim_command(string.format("Make %s %s%s", pattern, path, args))
  vim.o.makeprg = old_makeprg
  vim.o.errorformat = old_errorformat
end

cmd('command! -nargs=+ -complete=dir Grep lua run_grepprg(<f-args>)<CR>')

map {
  n = {
    ['<leader>ff'] = ':Files<CR>',
    ['<leader>fb'] = ':Buffers<CR>',
    ['<leader>f.'] = ':Dotfiles<CR>',
    ['<leader>bd'] = ':Sayonara!<CR>',
    ['<leader>bD'] = ':Sayonara<CR>',
    ['[h']         = ':GitGutterPrevHunk<CR>',
    [']h']         = ':GitGutterNextHunk<CR>',
    ['<leader>gg'] = ':Git<CR>',
    ['<leader>gb'] = ':Git blame<CR>',
    ['<leader>gl'] = ':Git log<CR>'
  }
}

map({ n = {
  ['<LEADER>fF'] = ':Files ',
  ['<LEADER>fg'] = ':Grep ',
}}, {silent = false})

cmd('autocmd TermOpen * setlocal nonumber norelativenumber')
