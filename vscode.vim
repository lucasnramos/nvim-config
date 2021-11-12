" List of plugins
" call plug#begin()
" Plug 'vim-airline/vim-airline'
" Plug 'tpope/vim-surround'
" call plug#end()

" Autocmds
autocmd InsertEnter * norm zz
:let mapleader=" "
:nmap ç :
:nnoremap ; :
:vmap ç :
:vnoremap ; :
vnoremap > >gv
vnoremap < <gv
nnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>
nnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>
xnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>
xnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>
nnoremap <space>l <Cmd>call VSCodeNotify('whichkey.show')<CR>
nnoremap <C-b> <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
nnoremap gd <cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap gr <cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
