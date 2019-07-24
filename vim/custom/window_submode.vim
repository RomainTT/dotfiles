" -----------------------------------------------------------------------------
" This is a VIM configuration file to make a submode for window manipulation.
" It makes use of the plugin https://github.com/kana/vim-submode.git
" This configuration is optimized for BÉPO keyboard layout.
" -----------------------------------------------------------------------------

" A message will appear in the message line when you're in a submode
" and stay there until the mode has existed.
let g:submode_always_show_submode = 1

" Do not leave window mode automatically (use <ESC>)
let g:submode_timeout = 0

" Enter window mode with gw
call submode#enter_with('window', 'n', '', 'gw')

" Note: <C-c> will also get you out to the mode without this mapping.
" Note: <C-[> also behaves as <ESC>
call submode#leave_with('window', 'n', '', '<ESC>')

" GENERIC MAPPING, NOT MODIFIED FOR BÉPO
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Go through every letter
for key in ['a','b','c','d','e','f','g','h','i','j','k','l','m',
\           'n','o','p','q','r','s','t','u','v','w','x','y','z']
  " maps lowercase, uppercase and <C-key>
  call submode#map('window', 'n', '', key, '<C-w>' . key)
  call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
  call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
endfor

" Go through symbols. Sadly, '|', not supported in submode plugin.
for key in ['=','_','+','-','<','>']
  call submode#map('window', 'n', '', key, '<C-w>' . key)
endfor

" Use & to resize to 80 characters
call submode#map('window', 'n', '', '&', ':vertical resize 80<CR>')

" OVERRIDE DEFAULT MAPPING FOR BÉPO LAYOUT
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

call submode#map('window', 'n', '', 't', '<C-w>j')
call submode#map('window', 'n', '', 's', '<C-w>k')
call submode#map('window', 'n', '', 'c', '<C-w>h')
call submode#map('window', 'n', '', 'r', '<C-w>l')
call submode#map('window', 'n', '', 'l', '<C-w>p')
call submode#map('window', 'n', '', 'd', '<C-w>c')
call submode#map('window', 'n', '', 'h', '<C-w>s')
call submode#map('window', 'n', '', 'm', '<C-w>r')
call submode#map('window', 'n', '', 'M', '<C-w>R')
call submode#map('window', 'n', '', 'T', '<C-w>J')
call submode#map('window', 'n', '', 'S', '<C-w>K')
call submode#map('window', 'n', '', 'C', '<C-w>H')
call submode#map('window', 'n', '', 'R', '<C-w>L')
call submode#map('window', 'n', '', '«', '<C-w><')
call submode#map('window', 'n', '', '»', '<C-w>>')
