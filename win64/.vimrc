" ----- Vim display setup
set t_Co=256
set encoding=utf-8
set nocompatible



" ----- Plugins setup
call plug#begin('~/.vim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
call plug#end()

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



" ----- Statusline
hi LineColor ctermbg=140
hi NormalColor ctermbg=46 ctermfg=0
hi InsertColor ctermbg=58 ctermfg=0
hi ReplaceColor ctermbg=165 ctermfg=0
hi VisualColor ctermbg=202
set laststatus=2
set statusline=
set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=%#LineColor#\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=%#NormalColor#\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 



" ----- Set colorsheme last
colo peachpuff