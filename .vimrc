"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  let g:rc_dir = expand('~/dotfiles/vim/dein')
  let s:toml = g:rc_dir . '/dein.toml'
  " let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOMLファイルにpluginを記述
  " call dein#load_toml(s:toml, {'lazy': 0})
  " call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#load_toml(s:toml)

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" kaoriya同封のプラグイン有効
" ’%‘で対応タグに移動するプラグインを有効化
source $VIMRUNTIME/macros/matchit.vim
" 同じファイルを開かないようにする
source $VIMRUNTIME/macros/editexisting.vim


" =============================================================================
" 各種設定 start
" =============================================================================
syntax on


" -----------------------------------------------------------------------------
" set
" -----------------------------------------------------------------------------
" yank したテキストをクリップボードに格納する
set clipboard=unnamed,autoselect

" Directories for swp files
" 「ファイル名 . 拡張子~」といった末尾にチルダを付けたファイルを
" バックアップファイルとして作成させない
set nobackup
set noswapfile
set noundofile

" Undoの永続化、undoフォルダ作成すること
" 肥大化するこで定期的に削除
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" ファイル保存時の場所を、開いているファイルが有る場所に設定
set browsedir=buffer

" ツールバーを非表示にする
set guioptions-=T

" 画面最下行にルーラーを表示する
set ruler

" 行番号を表示
set number

" 行番号の幅を前後1スペース設ける
augroup numberwidth
    autocmd!
    autocmd BufEnter,WinEnter,BufWinEnter * let &l:numberwidth = len(line("$")) + 2
augroup END

" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu

" コマンドライン補間をシェルっぽく
set wildmode=list:longest

" ビープ音消す
set visualbell t_vb=

" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title

" 補完メニューの高さ
set pumheight=10

" 対応した括弧にカーソルが飛ぶようにする
set showmatch

" カーソルに飛ぶ時間を設定
set matchtime=1

" 外部でファイルに変更がされた場合は読みなおす
set autoread


" ------------------------------------
" 文字コード、改行コード
" ------------------------------------
" デフォルトのエンコード
set encoding=utf-8

" 自動判別の設定 。列挙された文字コードの順番でファイルを開き、
" 上手くいった文字コードがファイル表示に採用
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

" 改行コード dos: <CR><NL>, unix: <NL>, mac: <CR>
set fileformats=unix,dos,mac


" ------------------------------------
" ステータスバー
" ------------------------------------
" エディタ上部にタブバーを常に表示する設定
set showtabline=2


" ステータスライン情報
" ------------------------------------
" 行が長すぎるときに切り詰める位置
set statusline=%<

" ファイル名（相対パス）
set statusline+=%f

" 空白スペース
set statusline+=\

" %m 修正フラグ（[+]または[-]）
set statusline+=%m

" %r 読み込み専用フラグ
set statusline+=%r

" %h ヘルプバッファフラグ
set statusline+=%h

" preview window flag
set statusline+=%w

" 左寄せと右寄せ項目の区切り（続くアイテムを右寄せにする）
set statusline+=%=

" 表示
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}

" 現在のカーソルの行番号
set statusline+=[%l行]

" 何列目にカーソルがあるか
set statusline+=[%c列]


" ----------------------------------------------------------------------------
" 入力画面
" -----------------------------------------------------------------------------
" タブなどの特殊文字を表示
set list

" 特殊文字の表示方法
set listchars=tab:>-,trail:-,eol:↲,extends:>,precedes:<,nbsp:%

" 画面上で表示する1つのタブの幅
set tabstop=4

" 自動インデントでのインデントの長さ
set shiftwidth=4

" いくつの連続した空白を1回で削除できるようにするか
set softtabstop=4

" tabキーを押すとスペースが入力
set expandtab

" 改行した時に自動でインデント
set autoindent

" {があると次の行は自動で1段深く自動インデント
set smartindent

" 拡張子ごとにインデントを変更
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal noautoindent tabstop=1 softtabstop=0 shiftwidth=0
    autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" 全角スペースの表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=red
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif


" -----------------------------------------------------------------------------
" キーマップ設定
" -----------------------------------------------------------------------------
" 数字のインクリメント、デクリメントのキーマップ変更
nnoremap + <C-a>
nnoremap - <C-x>

" 検索結果ハイライトをESCキーの連打でリセット
nnoremap <ESC><ESC> :nohlsearch<CR>


" -----------------------------------------------------------------------------
" そのほか
" -----------------------------------------------------------------------------
" カレントウィンドウのカレントディレクトリを変更
nnoremap <leader>. :lcd %:p:h<CR>

" 開いているHTMLをchromeで開く　：「\　shift + w」
noremap <Leader>W :silent !　start chrome.exe "%"<CR>


" -----------------------------------------------------------------------------
" プラグインなど
" -----------------------------------------------------------------------------
if filereadable(expand('~/dotfiles/vim/plugins.vim'))
    source ~/dotfiles/vim/plugins.vim
endif


" =============================================================================
" 各種設定 end
" =============================================================================
" filetypeの自動検出
filetype on
