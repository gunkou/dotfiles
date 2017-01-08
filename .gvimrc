source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

" font
set guifont=MyricaM_M:h12:cSHIFTJIS

" 半透明
autocmd FocusGained * set transparency=220
autocmd FocusLost * set transparency=128

" ウィンドウいっぱいに開く
au GUIEnter * simalt ~x

" ツールバーを非表示
set guioptions-=T

"メニューを非表示
set guioptions-=m


" ------------------------------------
" term gui colors
" ------------------------------------
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
colorscheme tender


" ------------------------------------
" 入力画面
" ------------------------------------
" 背景色だけ変更
hi Normal guibg=#282C34

" 80行目に色を付ける
set colorcolumn=80

" カレント行ハイライトON
set cursorline

" アンダーラインを引く(gui)
highlight CursorLine gui=underline guifg=NONE guibg=NONE
