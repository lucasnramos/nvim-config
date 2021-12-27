Guifont! Cascadia Code:h14

function! AdjustFontSize(amount)
  let s:fontSize = 14+a:amount
  :execute "GuiFont! Cascadia Code:h" . s:fontSize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a


" In normal mode, pressing numpad's+ increases the font
noremap <C-PageUp> :call AdjustFontSize(1)<CR>
noremap <C-PageDown> :call AdjustFontSize(-1)<CR>

" In insert mode, pressing ctrl + numpad's+ increases the font
inoremap <C-PageUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-PageDown> <Esc>:call AdjustFontSize(-1)<CR>a
