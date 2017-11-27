set nocompatible              " be iMproved, required
syntax on
set number
filetype off
set expandtab

" *** Ruler ***
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set cc=80,100

" *** Remove unwanted spaces on save ***
autocmd BufWritePre * %s/\s\+$//e

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'godlygeek/tabular'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-node'
Plugin 'jelera/vim-javascript-syntax'

call vundle#end()            " required
filetype plugin indent on    " required

" *** NERDTree ***
autocmd StdinReadPre * let s:std_in=1
" Opens it when no file is specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Opens it when directory is specified
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if the only open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" *** Airline ***
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" *** Python PEP8 Styles ***
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set autoindent |
    \ set fileformat=unix

" *** JS, HTML and CSS Styles ***
au BufNewFile,BufRead *.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set autoindent

" *** Shortcuts ***
" Open NERDTree with 'F3'
map <F3> :NERDTreeToggle<CR>
" Show buffers with '\b'
nnoremap <Leader>b :ls<CR>:b<Space>
