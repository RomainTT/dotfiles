" ---------------------------------------------------------
" Main vim configuration
" Contains all the plugins managed by Vundle and their specific
" configurations.
" .vim/after/ftplugin
" ---------------------------------------------------------

" ----------------- VUNDLE CONFIGURATION ------------------

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
call vundle#rc("~/.config/nvim/bundle/")

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins about interface
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kana/vim-submode'
Plugin 'gcmt/taboo.vim'
Plugin 'NLKNguyen/papercolor-theme'
" Plugins about python
Plugin 'plytophogy/vim-virtualenv'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/echodoc.vim'
Plugin 'deoplete-plugins/deoplete-jedi'
Plugin 'neomake/neomake'
Plugin 'psf/black'
" Plugins about Rust
Plugin 'rust-lang/rust.vim'
" Plugins about git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'christoomey/vim-conflicted'
" Other plugins to make edition easier
Plugin 'pseewald/vim-anyfold'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kshenoy/vim-signature'
Plugin 'Yggdroot/indentLine'
Plugin 'chrisbra/csv.vim'
Plugin 'tpope/vim-surround'
" A Plugin to use VIM for todo lists
Plugin 'freitass/todo.txt-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ----------------- GLOBAL VIM CONFIGURATION ------------------

" Set colorscheme
" (before everything else because it clears highlights)
set background=dark
colorscheme PaperColor

" Add custom window submode
source ~/.config/nvim/custom/window_submode.vim

" Add special config for bépo keyboards
source ~/.config/nvim/custom/bepo.vim

" Enable syntax highlighting
syntax on

" Turn ON line numbering
set nu

" Do not let the curser get too close to the edge
set scrolloff=3

" Set default tabstop to 4
set tabstop=4

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Make Vim automatically read the file again 
" if it has been modified externally
set autoread

" Highlight search matches
set hlsearch
" Change default color of matches
hi Search cterm=NONE ctermfg=black ctermbg=yellow
" Press Return to temporarily get out of the highlighted search
nnoremap <CR> :nohlsearch<CR><CR>

" Search and replace the current word with <leader>h
nnoremap <Leader>h :%s/\<<C-r><C-w>\>//g<Left><Left>

" Search the current selection with / in visual mode
vnoremap / y<ESC>/\V<c-r>=escape(@",'/\:')<CR><CR>

" Shortcut to save file
nnoremap <Leader>w :w<CR>

" A custom command to format json using jq
command! -range -nargs=0 -bar JQ <line1>,<line2>!jq --tab .

" No concealing
set conceallevel=0

" ----------------- PLUGINS CONFIGURATIONS ------------------

" Configure deoplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Configure echodoc
let g:echodoc#enable_at_startup	= 1
let g:echodoc#type = "virtual"

" Configure neomake
let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)
hi NeomakeVirtualtextError ctermbg=234 ctermfg=Red
hi NeomakeVirtualtextWarning ctermbg=234 ctermfg=LightYellow
hi NeomakeVirtualtextInfo ctermbg=234 ctermfg=White
hi NeomakeVirtualtextMessage ctermbg=234 ctermfg=LightGrey

" Language formatting with plugins
autocmd Filetype python nnoremap <leader>f :Black<CR>
autocmd Filetype rust nnoremap <leader>f :RustFmt<CR>

" Ignore files in NERDTree
let NERDTreeIgnore=['\~$']
" Start NERDTree if nvim is launched from a git repo
" and no file is opened at start
silent !git rev-parse --is-inside-work-tree
if !v:shell_error && @% == ""
		autocmd VimEnter * NERDTree
endif

" Set airline theme and configure the status line
let g:airline_theme='simple'
let g:airline#extensions#branch#enabled=1
let g:airline_powerline_fonts = 0
let g:airline_section_z = '☰ %l/%L:%v'

" vim-signature options
let g:SignatureMarkTextHLDynamic = 1
" Activate Anyfold by default
autocmd VimEnter * AnyFoldActivate

" For Git diff
set diffopt+=vertical

" For IndentLine
let g:indentLine_char = '┆'

" Configure vim-surround
let g:surround_no_mappings = 1
nmap <leader>sd  <Plug>Dsurround
nmap <leader>sc  <Plug>Csurround
nmap <leader>sC  <Plug>CSurround
nmap <leader>sy  <Plug>Ysurround
nmap <leader>sY  <Plug>YSurround
nmap <leader>sys <Plug>Yssurround
nmap <leader>sYs <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround
imap    <C-S> <Plug>Isurround
"imap    <C-G>s <Plug>Isurround
"imap    <C-G>S <Plug>ISurround
" A shortcut to add surroundings to the current word
nmap <leader>sw <leader>syiw
nmap <leader>sW <leader>syiW
