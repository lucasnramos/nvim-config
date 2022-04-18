autocmd InsertEnter * norm zz
:let mapleader=" "
:nmap ç :
:nnoremap ; :
:vmap ç :
:vnoremap ; :
vnoremap > >gv
vnoremap < <gv
nnoremap <C-b> <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
nnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.togglePanel')<CR>
nnoremap gd <cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
nnoremap gr <cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
