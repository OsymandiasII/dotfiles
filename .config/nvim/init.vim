call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-gitgutter'

Plug 'majutsushi/tagbar'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'

call plug#end()

set nocompatible
set nobackup
set noswapfile
set showmatch
set textwidth=79
set cursorline
set colorcolumn=+1
set background=dark
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:tagbar_width = 30

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/6.0.1/include'


" airline options
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set mouse=a

syntax enable

" Reload a file when it is changed from the outside
set autoread

" Show command being executed
set showcmd

" Show line number
set number

" Always show status line
set laststatus=2

" Display whitespace characters
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤
set fillchars=vert:│

" Briefly show matching braces, parens, etc
set showmatch

set tabstop=4 shiftwidth=4 expandtab

map <C-Left> <C-W>h
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Right> <C-W>l

function! SwitchSourceHeader()
  if (expand ("%:e") == "cpp")
    find %:t:r.h
  else
    find %:t:r.cpp
  endif
endfunction

nmap <C-Space> :call SwitchSourceHeader()<CR>
