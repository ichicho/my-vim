" put in `~/.vim/ftplugin/python.vim`
setlocal tabstop=8
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab

setlocal autoindent
setlocal smarttab

setlocal textwidth=79

" Immediately add a closing quotes or braces in insert mode
inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

" Run python script with F5
nnoremap <buffer> <F5> :w \| exec '!clear; python' shellescape(@%, 1)<cr>
