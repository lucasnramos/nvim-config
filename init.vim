" List of plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

" Neovim Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Themes
Plug 'dracula/vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'lifepillar/vim-solarized8'
call plug#end()

set background=dark
colo codedark

" Initial sets
set nocompatible
syntax on
set noerrorbells
set t_vb=                            " Disable all visual blink or bell
set hidden                           " Opening a new file on current buffer, hides the previous one instead of closing (keep changes)
set wildmenu                         " Improved completion on command line mode
set smartcase                        " case insensitive search, unless Case is used
set ignorecase
set confirm                          " confirm closing files / buffers with unsaved changes
set visualbell                       " visual feedback instead of beep sound
set mouse=a                          " Enable mouse support on different modes, 'a' for all modes
set cmdheight=2                      " Number of lines allocated for the command line
set number                           " display line number
set relativenumber                   " Display relative line numbers
set notimeout ttimeout ttimeoutlen=0 " time to wait when using chord commands
set pastetoggle=<F11>                " Keybind for paste toggle
set shiftwidth=2                     " Jump two spaces when shift + >
set softtabstop=2                    " Tabs - 2 width
set expandtab                        " tabs to spaces
set clipboard+=unnamedplus           " Neovim only - use system clipboard (depends on xclip or xsel)
set splitbelow splitright            " Split to right and down instead of left and up
set cursorline                       " Line highlight
set cursorcolumn                     " Column highlight
set colorcolumn=80                   " Show colored column at X
set noswapfile
set termguicolors                    " Full color support
set scrolloff=8
set nohlsearch                       " Disables search highlight
set nowrap                           " Disable word wrapping
set signcolumn=yes
set encoding=utf-8
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
filetype indent plugin on

" Autocmds
autocmd InsertEnter * norm zz
autocmd BufWritePost $MYVIMRC so $MYVIMRC

" ====================
" Custom keybidings
" ====================
:let mapleader=" "
:nmap ç :
:nnoremap ; :
:vmap ç :
:vnoremap ; :
nnoremap <leader>rco :tabnew $MYVIMRC<CR>
nnoremap <leader>rcr :so $MYVIMRC<CR>
nnoremap <leader>grco :tabnew ~\AppData\Local\nvim\ginit.vim<CR>
nnoremap <leader>grcr :so $MYVIMRC<CR>
vnoremap > >gv
vnoremap < <gv
nnoremap <leader>y "*y
nnoremap <leader>Y "*Y
vnoremap <leader>y "*y
vnoremap <leader>Y "*Y
inoremap <S-Insert> <C-R>*
imap jj <ESC>
imap jk <ESC>
imap fj <ESC>
nnoremap <leader>ex :Ex<CR>
nnoremap <leader>sex :Sex<CR>

" Auto close brackets in insert mode
" inoremap "" ""<left>
" inoremap '' ''<left>
" inoremap (( ()<left>
" inoremap [[ []<left>
" inoremap {{ {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

" Splits
" Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize
noremap <silent> <C-Left> :vertical resize +5<CR>
noremap <silent> <C-Right> :vertical resize -5<CR>
noremap <silent> <C-Up> :resize +5<CR>
noremap <silent> <C-Down> :resize -5<CR>

" Buffers
nnoremap <leader>bda :bufdo bd

" Project navigation
nnoremap <leader>PHN :cd ~\\Projects\\phoenix-spa\\src\\app<CR>
nnoremap <leader>Notes :cd ~\\Projects\\notes<CR>

" nvim-terminal
:tnoremap <Esc> <C-\><C-n>
nnoremap <leader>pwr :tabnew term://powershell<CR>

" ====================
" Plugin keybidings
" ====================

" fugitive
nnoremap <leader>gg :Git<space>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gpp :Git push<space>
nnoremap <leader>gpu :Git push -u origin<space>
nnoremap <leader>gpl :Git pull<space>
nnoremap <leader>gco :Git checkout<space>
nnoremap <leader>gft :Git fetch<CR>

" ================================
" Telescope
" ================================
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
require("telescope").setup {
  defaults = {
    path_display = { "tail" }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = false,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          -- or right hand side can also be the name of the action as string
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          ["dd"] = require("telescope.actions").delete_buffer,
        }
      }
    }
  }
}


EOF

" ================================
" Airline
" ================================
let g:airline_section_c = '%t'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''

" ================================
" COC
" ================================
autocmd FileType json syntax match Comment +\/\/.\+$+
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-tsserver', 'coc-angular', 'coc-pairs' ]

if has('nvim')
  inoremap <silent><expr> <c-n> coc#refresh()
  nnoremap <silent><expr> <c-n> coc#refresh()
  inoremap <silent><expr> <c-space> coc#refresh()
  nnoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
" Search workleader symbols.
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>cp  :<C-u>CocListResume<CR>
