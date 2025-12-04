" Various config
set nocompatible
syntax on
set modelines=0
set number
set encoding=utf-8
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set copyindent
set expandtab
set noshiftround
set hlsearch
set incsearch
set showmatch
set smartcase
set hidden
set ttyfast
set laststatus=2
set showcmd
set background=dark

" Syntax highlighting
filetype indent on
syntax on

" Remapping keys
noremap <Space> <Nop>
let mapleader = ' ' 
let maplocalleader = ' ' 
noremap <Leader>t <CR>
noremap <C-a> <C-w>h
noremap <C-s> <C-w>j
noremap <C-w> <C-w>k
noremap <C-d> <C-w>l
noremap <C-Up> :resize -2<cr>
noremap <C-Down> :resize +2<cr>
noremap <C-Left> :vertical resize -2<cr>
noremap <C-Right> :vertical resize +2<cr>
noremap <C-S-Up> :m .-2<cr>gv=gv
noremap <C-S-Down> :m .+1<cr>gv=gv

" Plugins
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/seoul256.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'github/copilot.vim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/spacehi.vim'
call plug#end()

" Theme
colorscheme seoul256
let g:lightline = { 'colorscheme': 'wombat' }
