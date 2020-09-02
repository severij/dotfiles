call plug#begin('~/.local/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'jacoborus/tender.vim'

call plug#end()

set nu       " Enable line numbers.
set hls      " Highlight matching search patterns.
set ic       " Ignore case when searching
set scs      " Override 'ignorecase' when the search contains upper case chars.
set hid      " Buffer becomes hidden when it's abandoned
set lz       " The screen won't be redrawn while executing macros.
set so=5     " Minimal # of screen lines to keep above and below the cursor.
set tgc      " Enable 24-bit RGB color in the TUI.
set pb=18    " Enable pseudo-transparency for the popup-menu.
set winbl=18 " Enable pseudo-transparency for a floating window.
set wop=pum  " Display completion matches using the popup-menu.

autocmd FocusGained,BufEnter * :checktime

colorscheme tender
set background=dark

let mapleader = ' '
let g:sneak#use_ic_scs = 1

" Fzf mappings.
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fc :Commands<CR>
nnoremap <Leader>fr :Rg 
nnoremap <Leader>fl :BLines 

" Git related mappings.
nnoremap <Leader>gg :Git<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gb :Git blame<CR>

" Open terminal and go to insert mode.
nnoremap <leader>ot :terminal<cr>i
" Go back to Normal mode with <Esc>.
tnoremap <Esc> <C-\><C-n>
