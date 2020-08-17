" ----- Vim display setup
set t_Co=256
"set encoding=utf-8
"set nocompatible



" ----- Plugins
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Airline conf
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" Ignore scala target folders in ctrl+p
let g:ctrlp_custom_ignore = 'target/'

" Re mapping NerdTree toggle command
map <C-n> :NERDTreeToggle<CR>



" ----- Syntax highlighting
filetype plugin indent on
syntax enable
au BufNewFile,BufRead *.go set filetype=go



" ----- Auto-indentation
set autoindent



" ----- Backspace config
set backspace=indent,eol,start
set expandtab
set shiftwidth=4
set softtabstop=4



" ----- Theme
set nu
set list
set listchars=tab:→\ ,trail:·,eol:¬
colorscheme peachpuff
