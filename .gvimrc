source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

" 80行目に色を付ける
set colorcolumn=80

" カレント行ハイライトON
set cursorline

" font
set guifont=MyricaM_M:h12:cSHIFTJIS

" カラースキーム
colorscheme kellys

" 半透明
autocmd FocusGained * set transparency=230
autocmd FocusLost * set transparency=128

" ウィンドウいっぱいに開く
au GUIEnter * simalt ~x

" アンダーラインを引く(gui)
highlight CursorLine gui=underline guifg=NONE guibg=NONE
