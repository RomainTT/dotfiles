" If this file is used as an additional configuration aside from another one
" with Vundle plugins for instance, then I recommend to source .vimrc.bepo
" at first.
" --------------------------------------------------------------------------------

" Change map leader
:let mapleader="è"
:let maplocalleader="è"

" {W} -> [É]
" ——————————
" On remappe W sur É :
noremap é w
noremap É W
" Corollaire: on remplace les text objects aw, aW, iw et iW
" pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
onoremap aé aw
onoremap aÉ aW
onoremap ié iw
onoremap iÉ iW
 
" [HJKL] -> {CTSR}
" ————————————————
" {cr} = « gauche / droite »
noremap c h
noremap r l
" {ts} = « haut / bas »
noremap t j
noremap s k
" {CR} = « haut / bas de l'écran »
noremap C H
noremap R L
" {TS} = « joindre / aide »
noremap T J
noremap S K
" Corollaire : repli suivant / précédent
noremap zs zj
noremap zt zk
 
" {HJKL} <- [CTSR]
" ————————————————
" {J} = « Jusqu'à »            (j = suivant, J = précédant)
noremap j t
noremap J T
" {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
noremap l c
noremap L C
" {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
noremap h r
noremap H R
" {K} = « Substitue »          (k = caractère, K = ligne)
noremap k s
noremap K S
" Corollaire : correction orthographique
noremap ]k ]s
noremap [k [s
 
" Désambiguation de {g}
" —————————————————————
" ligne écran précédente / suivante (à l'intérieur d'une phrase)
noremap gs gk
noremap gt gj
" onglet précédant / suivant
noremap gb gT
noremap gé gt
" optionnel : {gB} / {gÉ} pour aller au premier / dernier onglet
noremap gB :exe "silent! tabfirst"<CR>
noremap gÉ :exe "silent! tablast"<CR>
" optionnel : {g"} pour aller au début de la ligne écran
noremap g" g0
 
" <> en direct
" ————————————
noremap « <
noremap » >
 
" Remaper la gestion des fenêtres
" ———————————————————————————————
" Déplacements du curseur
noremap <C-w>t <C-w>j
noremap <C-w>s <C-w>k
noremap <C-w>c <C-w>h
noremap <C-w>r <C-w>l
noremap <C-w>l <C-w>p
" Split
noremap <C-w>d <C-w>c
noremap <C-w>h <C-w>s
" Déplacement des fenêtres
noremap <C-w>m <C-w>r
noremap <C-w>M <C-w>R
noremap <C-w>T <C-w>J
noremap <C-w>S <C-w>K
noremap <C-w>C <C-w>H
noremap <C-w>R <C-w>L
" Simplification du <C-w> en w pour plus de rapidité
map w <C-w>

" colorise les nbsp
" ———————————————————————————————
highlight NbSp ctermbg=lightgray guibg=lightgray 
call matchadd('NbSp', '\%xA0')


" Change les touches de NERDTree pour bépo
" ————————————————————————————————————————
let g:NERDTreeMapActivateNode = "oo"
let g:NERDTreeMapPreview = "oO"
let g:NERDTreeMapOpenInTab = "ot"
let g:NERDTreeMapOpenInTabSilent = "oT"
let g:NERDTreeMapOpenSplit = "oh"
let g:NERDTreeMapPreviewSplit = "oH"
let g:NERDTreeMapOpenVSplit = "ov"
let g:NERDTreeMapPreviewVSplit = "oV"
let g:NERDTreeMapOpenRecursively = "oR"
let g:NERDTreeMapJumpNextSibling = "r"
let g:NERDTreeMapJumpFirstChild = "C"
let g:NERDTreeMapJumpPrevSibling= "c"
let g:NERDTreeMapJumpParent = "S"
let g:NERDTreeMapJumpLastChild = "R"
let g:NERDTreeMapChangeRoot = "gcr"
let g:NERDTreeMapRefresh = "gr"
let g:NERDTreeMapRefreshRoot = "gR"
let g:NERDTreeMapChdir = "gcd"
let g:NERDTreeMapToggleHidden = "h"
let g:NERDTreeMapCWD = "gCD"
