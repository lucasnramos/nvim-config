" List of plugins vim-plug
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'mattn/emmet-vim'
" Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/conflict-marker.vim'

" Themes
Plug 'dracula/vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tomasr/molokai'
Plug 'doums/darcula'
Plug 'bluz71/vim-nightfly-guicolors'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'liuchengxu/vim-which-key'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/eslint.nvim'
Plug 'MunifTanjim/prettier.nvim'
call plug#end()

set termguicolors
set background=dark
colo nightfly

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
set timeoutlen=200
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
set updatetime=500
set visualbell
set wildmenu

autocmd InsertEnter * norm zz
autocmd BufWritePost *.vim so $MYVIMRC
autocmd BufWrite *.js,*.jsx,*.ts,*.tsx :Prettier

" =========================
" Global command Character
" =========================
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

nmap ?? :
nnoremap ; :
tnoremap <Esc> <C-\><C-n>
vmap ?? :
vnoremap ; :
xmap ?? :
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
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-o> :bnext<CR>
nnoremap <A-i> :bprevious<CR>
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

" Commentary
nnoremap <leader>c <cmd>Commentary<CR>

" WhichKey

" Define prefix dictionary - empty so we can add as needed
let g:which_key_map = {}
call which_key#register('<Space>', 'g:which_key_map')

" Second level dict
let g:which_key_map.t = { 'name': '+telescope' }
let g:which_key_map.c = { 'name': 'Commentary' }
let g:which_key_map.l = { 'name': '+lsp' }
let g:which_key_map.l.g = { 'name': '+goto' }
let g:which_key_map.g = { 'name': '+git' }
let g:which_key_map.g.d = { 'name': '+diff' }
let g:which_key_map.b = { 'name': '+buffer' }
let g:which_key_map.w = { 'name': '+window' }


nnoremap <silent> <leader>      :<c-u>WhichKey  '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
nnoremap <silent> <BS>          :WhichKey       '\<BS\>'<CR>

" Telescope
nnoremap <silent> <C-p>       :Telescope find_files<CR>
nnoremap <silent> <leader>tp  :Telescope builtin<CR>
nnoremap <silent> <leader>tf  :Telescope find_files<CR>
nnoremap <silent> <leader>tg  :Telescope git_files<CR>
nnoremap <silent> <leader>ts  :Telescope lsp_document_symbols<CR>
nnoremap <silent> <leader>tws :Telescope lsp_workspace_symbols<CR>
nnoremap <silent> <leader>td  :Telescope diagnostics<CR>
nnoremap <silent> <leader>th  :Telescope help_tags<CR>
nnoremap <silent> <leader>tl  :Telescope live_grep<CR>
nnoremap <silent> <leader>tb  :Telescope buffers<CR>

" LSP
nnoremap <silent> <C-k> :lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>lD :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>lh :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>la :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ldn :lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>ldp :lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>le :lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <leader>lf :lua vim.lsp.buf.format()<CR>
nnoremap <silent> <leader>lgD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>lgd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>lgi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>lgr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>lq :lua vim.diagnostic.setloclist()<CR>
nnoremap <silent> <leader>lr :lua vim.lsp.buf.rename()<CR>

" Definitions and declarations without leader
nnoremap <silent> gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>

" Nvim Tree
nnoremap <silent> <leader>e :NvimTreeToggle<CR>

" Prettier
nnoremap <silent> <leader>P :Prettier<CR>
