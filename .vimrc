" General settings
set nocompatible                            " Disable Vi compatibility
syntax on                                   " Enable syntax highlighting
filetype plugin indent on                   " Enable filetype-based plugins and indentation
set encoding=utf-8                          " Use UTF-8 encoding
set number                                  " Show line numbers
set wrap                                    " Enable line wrapping
set background=dark                         " Use a dark background

" Indentation settings
set tabstop=4                               " Number of spaces for a tab
set shiftwidth=4                            " Number of spaces for autoindent
set softtabstop=4                           " Number of spaces for <Tab> in insert mode
set expandtab                               " Convert tabs to spaces
set autoindent                              " Copy indent from the current line
set copyindent                              " Copy existing indentation structure
set noshiftround                            " Don't round indent to multiple of shiftwidth

" Search settings
set hlsearch                                " Highlight search results
set incsearch                               " Incremental search
set smartcase                               " Case-insensitive search unless uppercase is used

" UI settings
set showmatch                               " Highlight matching parentheses
set hidden                                  " Allow switching buffers without saving
set ttyfast                                 " Faster redrawing for slow terminals
set laststatus=2                            " Always show the status line
set showcmd                                 " Show incomplete commands in the status line

" Leader key
let mapleader = " "                         " Set <Space> as the leader key
noremap <Space> <Nop>                       " Disable <Space> as a normal key

" Key mappings
nnoremap <Leader>t <CR>                     " Map <Leader>t to <CR>
nnoremap <C-a> <C-w>h                       " Navigate to the left window
nnoremap <C-s> <C-w>j                       " Navigate to the bottom window
nnoremap <C-w> <C-w>k                       " Navigate to the top window
nnoremap <C-d> <C-w>l                       " Navigate to the right window
nnoremap <C-Up> :resize -2<CR>              " Resize window vertically (shrink)
nnoremap <C-Down> :resize +2<CR>            " Resize window vertically (expand)
nnoremap <C-Left> :vertical resize -2<CR>   " Resize window horizontally (shrink)
nnoremap <C-Right> :vertical resize +2<CR>  " Resize window horizontally (expand)
nnoremap <C-t> :NERDTreeToggle<CR>          " Toggle NERDTree
nnoremap <C-t><C-f> :NERDTreeFind<CR>       " Find current file in NERDTree
nnoremap <C-f> :FZF /c/Workspace<CR>

" Plugin manager (vim-plug)
call plug#begin('~/.vim/plugged')               " Specify plugin directory
Plug 'preservim/nerdtree'                       " File explorer
Plug 'tomtom/tcomment_vim'                      " Commenting plugin
Plug 'junegunn/fzf', {'do': {-> fzf#install()}} " Fuzzy finding
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'                    " Lightweight statusline
Plug 'junegunn/seoul256.vim'                    " Seoul256 color scheme
call plug#end()

" Theme and appearance
let g:seoul256_background = 236             " Set Seoul256 background
colorscheme seoul256                        " Apply Seoul256 color scheme
let g:lightline = { 'colorscheme': 'one' }  " Lightline color scheme

" Copilot settings
let b:copilot_enabled = v:true              " Enable GitHub Copilot
autocmd ColorScheme * highlight CopilotSuggestion guifg=#555555 ctermfg=8
