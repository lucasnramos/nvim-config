" List of plugins vim-plug
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
" Plug 'neoclide/coc.nvim'

" Neovim Only
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'folke/lsp-colors.nvim'
Plug 'L3MON4D3/LuaSnip'

" Themes
Plug 'dracula/vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

set background=dark
colo gruvbox

" Initial sets
filetype indent plugin on
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
set notimeout ttimeout ttimeoutlen=0
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
syntax on

let mapleader=" "
autocmd InsertEnter * norm zz
autocmd BufWritePost $MYVIMRC so $MYVIMRC

" =========================
" Global command Character
" =========================
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
nnoremap <leader>bda :bufdo bd
nnoremap <leader>pwr :tabnew term://powershell<CR>
nnoremap <leader>rco :tabnew $MYVIMRC<CR>
nnoremap <leader>rcr :so $MYVIMRC<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bf :bprev<CR>
noremap <silent> <C-Down> :resize -5<CR>
noremap <silent> <C-Left> :vertical resize +5<CR>
noremap <silent> <C-Right> :vertical resize -5<CR>
noremap <silent> <C-Up> :resize +5<CR>
" ====================
" Visual Mode Remaps
" ====================
vnoremap < <gv
vnoremap > >gv

" Auto close brackets in insert mode
" inoremap
" inoremap '' ''<left>
" inoremap (( ()<left>
" inoremap [[ []<left>
" inoremap {{ {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

" ====================
" Plugin keybidings
" ====================
" fugitive
nnoremap <leader>gg :G<space>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gd2 :diffget //2<CR>
nnoremap <leader>gd3 :diffget //3<CR>

" =========================
" Plugin Configurations
" =========================
" Airline
" let g:airline_section_c = '%t'
" let g:airline_section_x = ''
" let g:airline_section_y = ''
" let g:airline_section_z = ''


" =========================
" Sourcing External Files
" =========================
" runtime 'coc-config.vim'

