source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

" 80行目に色を付ける
set colorcolumn=80

" カレント行ハイライトON
set cursorline

" font
set guifont=MyricaM_M:h12:cSHIFTJIS

" 半透明
autocmd FocusGained * set transparency=220
autocmd FocusLost * set transparency=128

" ウィンドウいっぱいに開く
au GUIEnter * simalt ~x

" アンダーラインを引く(gui)
highlight CursorLine gui=underline guifg=NONE guibg=NONE

" ------------------------------------
" termguicolors
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

" 背景色だけ変更
hi Normal guibg=#282C34
