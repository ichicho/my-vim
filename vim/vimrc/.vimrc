" Enable syntax highlighting
syntax on

" Enable file type based indentation
filetype plugin indent on

" show line numbers
set number

" Encoding
set encoding=utf-8

" show the matching part of the pair for [] {} and ()
set showmatch

" Enable file type based plugin
let b:did_ftplugin = 1

" Enable folding
set foldmethod=indent
" Open all folds when start buffer
autocmd BufRead * normal zR
" Enable folding with the spacebar
nnoremap <space> za

set hlsearch
set incsearch

set backspace=indent,eol,start

" YCM setting
let g:ycm_autoclose_preview_window_after_completion = 1
