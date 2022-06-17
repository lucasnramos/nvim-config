" List of plugins vim-plug
call plug#begin()
Plug 'tpope/vim-surround'
"  Plug 'editorconfig/editorconfig-vim'
"  Plug 'rhysd/conflict-marker.vim'
call plug#end()

" Initial sets
filetype indent plugin on
syntax on
set clipboard+=unnamedplus
set cmdheight=2
set colorcolumn=80
set confirm
set cursorline
set encoding=utf-8
set expandtab
set hidden
set ignorecase
set mouse=a
set nobackup
set nocompatible
set noerrorbells
set nohlsearch
set noswapfile
" set notimeout ttimeout 
set timeoutlen=400
set nowrap
set nowritebackup
set number
set pastetoggle=<F11>
set relativenumber
set scrolloff=8
set shiftwidth=2
set shortmess+=c
set signcolumn=yes
set smartcase
set softtabstop=2
set splitbelow splitright
set t_vb=
set termguicolors
set updatetime=300
set visualbell
set wildmenu

autocmd InsertEnter * norm zz
autocmd BufWritePost *.vim so $MYVIMRC

" =========================
" Global command Character
" =========================
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

nmap ç :
nnoremap ; :
tnoremap <Esc> <C-\><C-n>
vmap ç :
vnoremap ; :
xmap ç :
" ====================
" Insert Mode Remaps
" ====================
inoremap <S-Insert> <C-R>*
inoremap <S-Insert> <C-R>*
inoremap <C-o> <ESC>O
inoremap <A-h> <left>
inoremap <A-j> <down>
inoremap <A-k> <up>
inoremap <A-l> <right>
" ====================
" Normal Mode Remaps
" ====================
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-o> :bnext<CR>
nnoremap <A-i> :bprevious<CR>
nnoremap <leader>pwr :tabnew term://powershell<CR>
nnoremap <leader>rco :tabnew $MYVIMRC<CR>
nnoremap <leader>rcr :so $MYVIMRC<CR>
noremap <silent> <C-Down> :resize -5<CR>
noremap <silent> <C-Left> :vertical resize +5<CR>
noremap <silent> <C-Right> :vertical resize -5<CR>
noremap <silent> <C-Up> :resize +5<CR>
" ====================
" Visual Mode Remaps
" ====================
vnoremap < <gv
vnoremap > >gv

" ====================
" Plugin keybidings
" ====================
" fugitive
nnoremap <leader>gg :G<space>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gdo :diffget //2<CR>
nnoremap <leader>gdt :diffget //3<CR>

" vscode-neovim
nnoremap <M-h> <Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>
xnoremap <M-h> <Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>
nnoremap <space>l <Cmd>call VSCodeNotify('whichkey.show')<CR>
nnoremap <C-b> <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
nnoremap gd <cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap gr <cmd>call VSCodeNotify('editor.action.goToReferences')<CR>

" WhichKey
" Define prefix dictionary - empty so we can add as needed
let g:which_key_map = {}
call which_key#register('<Space>', 'g:which_key_map')

" Second level dict
let g:which_key_map.t = { 'name': '+telescope' }
let g:which_key_map.l = { 'name': '+lsp' }
let g:which_key_map.l.g = { 'name': '+goto' }
let g:which_key_map.g = { 'name': '+git' }
let g:which_key_map.g.d = { 'name': '+diff' }
let g:which_key_map.b = { 'name': '+buffer' }
let g:which_key_map.w = { 'name': '+window' }

nnoremap <silent> <leader>      :<c-u>WhichKey  '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <BS>          :WhichKey       '\<BS\>'<CR>