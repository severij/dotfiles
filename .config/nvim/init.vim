call plug#begin('~/.local/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/seoul256.vim'

call plug#end()

set hls  " Highlight matching search patterns.
set ic   " Ignore case when searching
set scs  " Override 'ignorecase' when the search contains upper case chars.
set hid  " Buffer becomes hidden when it's abandoned
set lz   " The screen won't be redrawn while executing macros.
set so=5 " Minimal number of screen lines to keep above and below the cursor.

autocmd FocusGained,BufEnter * :checktime

colorscheme seoul256
set background=dark

let g:sneak#use_ic_scs = 1
let g:seoul256_srgb = 1

let mapleader = ' '

" Git related mappings.
nnoremap <Leader>gg :Git<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gb :Git blame<CR>

" Open terminal and go to insert mode.
nnoremap <leader>ot :terminal<cr>i
" Go back to Normal mode with <Esc>.
tnoremap <Esc> <C-\><C-n>
