" Syntax highlighting
filetype plugin indent on
syntax enable
au BufNewFile,BufRead *.go set filetype=go

" Auto-indentation
set autoindent

" Backspace config
set backspace=indent,eol,start
set expandtab
set shiftwidth=4
set softtabstop=4

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
call plug#end()

let g:ctrlp_custom_ignore = 'target/'

map <C-n> :NERDTreeToggle<CR>