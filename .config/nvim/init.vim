"    ____              __    _   ____  ____      ____   _    ________  _________   _____________   ___    _   __
"   / __ \____ ___  __/ /   ( ) / __ )/ __/___  / __ \ ( )  / ____/ / / / ____/ | / / ____/__  /  /   |  / | / /
"  / /_/ / __ `/ / / / /    |/ / __  / /_/ __ \/ /_/ / |/  / / __/ / / / __/ /  |/ / __/    / /  / /| | /  |/ /
" / ____/ /_/ / /_/ / /       / /_/ / __/ /_/ / _, _/     / /_/ / /_/ / /___/ /|  / /___   / /__/ ___ |/ /|  /
"/_/    \__,_/\__,_/_/       /_____/_/  \____/_/ |_|      \____/\____/_____/_/ |_/_____/  /____/_/  |_/_/ |_/
"
" Author : Paul 'BfoR' GUENEZAN
" Repo   : https://github.com/bifore/dotfiles
"
"

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline' " fancy status line
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline

Plug 'mhinz/vim-startify' " custom home screen

Plug 'easymotion/vim-easymotion' " improve motion
Plug 'octol/vim-cpp-enhanced-highlight' "improve highlighting for C++ 11/14

Plug 'shougo/deoplete.nvim' " asynchronous completion framework
Plug 'zchee/deoplete-jedi' " deoplete source for Python
Plug 'zchee/deoplete-clang' " deoplete source for C/C++

Plug 'vim-scripts/sieve.vim' " sieve syntax

" Plug 'jacobsimpson/nvim-example-python-plugin' " tmp

call plug#end()

syntax on " switch syntax highliting on

" airline options
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" python client settings
let g:python_host_prog = 'python2'
let g:python3_host_prog = 'python'

" Disable vi compatibility mode
set nocompatible

" Use deoplete
let g:deoplete#enable_at_startup = 1
" deoplete-clang settings
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/5.0.0/include'

" Highlight if over 80 c.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

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

nnoremap <CR> :!./check<CR>
