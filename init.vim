" List of plugins vim-plug
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim'

" Neovim Only
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Neovim Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" Themes
Plug 'dracula/vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
call plug#end()

set background=dark
colo onedark

" Initial sets
filetype indent plugin on
set clipboard+=unnamedplus           " Neovim only - use system clipboard (depends on xclip or xsel)
set cmdheight=2                      " Number of lines allocated for the command line
set colorcolumn=80                   " Show colored column at X
set confirm                          " confirm closing files / buffers with unsaved changes
set cursorline                       " Line highlight
set encoding=utf-8
set expandtab                        " tabs to spaces
set hidden                           " Opening a new file on current buffer, hides the previous one instead of closing (keep changes)
set mouse=a                          " Enable mouse support on different modes, 'a' for all modes
set nobackup
set nocompatible
set noerrorbells
set nohlsearch                       " Disables search highlight
set noswapfile
set notimeout ttimeout ttimeoutlen=0 " time to wait when using chord commands
set nowrap                           " Disable word wrapping
set nowritebackup
set number                           " display line number
set pastetoggle=<F11>                " Keybind for paste toggle
set relativenumber                   " Display relative line numbers
set scrolloff=8
set shiftwidth=2                     " Jump two spaces when shift + >
set shortmess+=c
set signcolumn=yes
set smartcase                        " case insensitive search, unless Case is used
set softtabstop=2                    " Tabs - 2 width
set splitbelow splitright            " Split to right and down instead of left and up
set t_vb=                            " Disable all visual blink or bell
set termguicolors                    " Full color support
set updatetime=300
set visualbell                       " visual feedback instead of beep sound
set wildmenu                         " Improved completion on command line mode
syntax on

" Autocmds
autocmd InsertEnter * norm zz
autocmd BufWritePost $MYVIMRC so $MYVIMRC

" ====================
" Custom keybidings
" ====================
:let mapleader=" "
:nmap ç :
:nnoremap ; :
:tnoremap <Esc> <C-\><C-n>
:vmap ç :
:vnoremap ; :
:xmap ç :
imap fj <ESC>
imap jj <ESC>
imap jk <ESC>
inoremap <S-Insert> <C-R>*
inoremap <S-Insert> <C-R>*
inoremap fj <ESC>
inoremap jj <ESC>
inoremap jk <ESC>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>Notes :cd ~\\Projects\\notes<CR>
nnoremap <leader>PHN :cd ~\\Projects\\phoenix-spa\\src\\app<CR>
nnoremap <leader>Y "*Y
nnoremap <leader>bda :bufdo bd
nnoremap <leader>ee :Ex<CR>
nnoremap <leader>grco :tabnew ~\AppData\Local\nvim\ginit.vim<CR>
nnoremap <leader>grcr :so $MYVIMRC<CR>
nnoremap <leader>pwr :tabnew term://powershell<CR>
nnoremap <leader>rco :tabnew $MYVIMRC<CR>
nnoremap <leader>rcr :so $MYVIMRC<CR>
nnoremap <leader>see :Sex<CR>
nnoremap <leader>y "*y
noremap <silent> <C-Down> :resize -5<CR>
noremap <silent> <C-Left> :vertical resize +5<CR>
noremap <silent> <C-Right> :vertical resize -5<CR>
noremap <silent> <C-Up> :resize +5<CR>
vnoremap < <gv
vnoremap <leader>Y "*Y
vnoremap <leader>y "*y
vnoremap > >gv

" Auto close brackets in insert mode
" inoremap "" ""<left>
" inoremap '' ''<left>
" inoremap (( ()<left>
" inoremap [[ []<left>
" inoremap {{ {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

" ====================
" Plugin keybidings
" ====================
" Telescope
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" fugitive
nnoremap <leader>gg :Git<space>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gpp :Git push<space>
nnoremap <leader>gpu :Git push -u origin<space>
nnoremap <leader>gpl :Git pull<space>
nnoremap <leader>gco :Git checkout<space>
nnoremap <leader>gft :Git fetch<CR>

" =========================
" Plugin Configurations
" =========================
" Airline
let g:airline_section_c = '%t'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>



" =========================
" Sourcing External Files
" =========================
runtime coc-config.vim
" runtime lspconfig.vim
