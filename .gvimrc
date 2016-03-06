source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

"" カラースキーム
colorscheme kellys

"" 半透明
autocmd FocusGained * set transparency=230
autocmd FocusLost * set transparency=128

"" ウィンドウいっぱいに開く
au GUIEnter * simalt ~x

" カレント行ハイライトON
set cursorline
" アンダーラインを引く(gui)
highlight CursorLine gui=underline guifg=NONE guibg=NONE
