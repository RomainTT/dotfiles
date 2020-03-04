" Vim configuration for JSON files
" ----------------------------------

" Indentation
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2 
setlocal autoindent
setlocal fileformat=unix

" UTF-8 encoding by default
setlocal encoding=utf-8

" Flag unnecessary whitespaces
highlight BadWhitespace ctermbg=red guibg=darkred
call matchadd('BadWhitespace', '\s\+$')

