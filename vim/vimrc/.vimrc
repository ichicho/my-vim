" => Basic
set encoding=utf-8 " Encoding
set backspace=indent,eol,start " Fix backspace behavior

" => Looks
syntax on " Enable syntax highlighting
set number " Show line numbers
set ruler " Ruler (Line, column and % at the right bottom)
set showmatch " Show the matching part of the pair for [] {} and ()
set showcmd " Show last command in the status line
set laststatus=2 " Always show statusline

" => Search
set hlsearch " Highlight search results
set incsearch " Search as you type

" => Indent
filetype plugin indent on " Enable file type based indentation
let b:did_ftplugin = 1 " Enable file type based plugin

" => Fold
set foldmethod=indent " Enable folding
set foldlevelstart=99 " Open all folds when start buffer
nnoremap <space> za " Enable folding with the spacebar

" => Key remap
" Navigate windows with <Ctrl-hjkl> instead of <Ctrl-w> followed by hjkl
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

" => YCM setting
let g:ycm_autoclose_preview_window_after_completion = 1
