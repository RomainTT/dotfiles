" show the body width boundary (max 72 characters)
setlocal colorcolumn=73
setlocal textwidth=72

" warning if first line too long (max 50 characters)
match ErrorMsg /\%1l.\%>51v/

" spell check on
setlocal spell
