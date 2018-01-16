source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

if has('gui_macvim')
  " font
  set guifont=Ricty\ Diminished\ Regular:h12
  " 縦幅 デフォルトは24
  set lines=999
  " 横幅 デフォルトは80
  set columns=999
endif

" if has('unix')
" endif

" if has('mac')
" endif

" if has('unix') || has('mac')
" endif

if has('win32') || has ('win64')
  " font
  set guifont=MyricaM_M:h12:cSHIFTJIS

  " 半透明
  autocmd FocusGained * set transparency=220
  autocmd FocusLost * set transparency=128

  " ウィンドウいっぱいに開く
  au GUIEnter * simalt ~x
endif

" ツールバーを非表示
set guioptions-=T

"メニューを非表示
set guioptions-=m

" ------------------------------------
" vim-singleton
" ------------------------------------
" call singleton#enable()

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

" カレント行ハイライトを明示的にOFF
set nocursorline

" 行番号の相対表示を明示的にOFF
set norelativenumber


