" Vim configuration for python files
" ----------------------------------

" Indentation
setlocal tabstop=4 
setlocal softtabstop=4 
setlocal shiftwidth=4 
setlocal textwidth=79 
setlocal expandtab 
setlocal autoindent 
setlocal fileformat=unix

" UTF-8 encoding by default
setlocal encoding=utf-8

" Flag unnecessary whitespaces
highlight BadWhitespace ctermbg=red guibg=darkred
call matchadd('BadWhitespace', '\s\+$')

" Highlight text that exceeds 80 characters
highlight OverLength ctermbg=darkred ctermfg=white guibg=darkred
call matchadd('OverLength', '\%>80v.\+')

" Make code look pretty
let python_highlight_all=1

" Ignore .pyc files in NERDTree
call add(NERDTreeIgnore, '\.pyc$')

" Autocommands for python files
augroup autocmd_for_python_files
  " Remove autocmds from this group before adding them
  autocmd!
  " Remove trailing whitespaces on save
  autocmd FileType python autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END
