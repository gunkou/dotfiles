source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

"" カラースキーム
colorscheme desert
"" 半透明
autocmd FocusGained * set transparency=230
autocmd FocusLost * set transparency=128
"" ウィンドウいっぱいに開く
au GUIEnter * simalt ~x

" カレント行ハイライトON
set cursorline
" アンダーラインを引く(gui)
highlight CursorLine gui=underline guifg=NONE guibg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :`0 で直前のファイルを開く
" vimの文字コードを確認
" :set enc?
" ファイルの文字コードを確認
" :set fenc?
" エンコードを指定して保存し直す
" :set fenc=文字コード
