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
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOMLファイルにpluginを記述
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

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

" ’%‘で対応タグに移動するプラグインを有効化
source $VIMRUNTIME/macros/matchit.vim


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

" gvimでファイル保存ダイアログの初期ディレクトリ設定
set browsedir=buffer

" コマンドモードに戻るときにIMEをオフにする
set imdisable

" 端末でマウスを有効にする
set mouse=a

" ------------------------------------
" 文字コード、改行コード
" ------------------------------------
" デフォルトのエンコード
set encoding=utf-8

" 自動判別の設定 。列挙された文字コードの順番でファイルを開き、
" 上手くいった文字コードがファイル表示に採用
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif

if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif

" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" 改行コード dos: <CR><NL>, unix: <NL>, mac: <CR>
set fileformats=unix,dos,mac


" -----------------------------------------------------------------------------
" 入力画面
" -----------------------------------------------------------------------------
" エディタ上部にタブバーを常に表示する設定
set showtabline=2

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

" ESCでIMEを確実にOFF
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" -----------------------------------------------------------------------------
" 検索
" -----------------------------------------------------------------------------
" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>


" -----------------------------------------------------------------------------
" そのほか
" -----------------------------------------------------------------------------
" カレントウィンドウのカレントディレクトリを変更
nnoremap <leader>. :lcd %:p:h<CR>

" 開いているHTMLをchromeで開く　：「\　shift + w」
noremap <Leader>W :silent !　start chrome.exe "%"<CR>

" 入力補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" vimproc に Windows の DLL ダウンロード機能を有効にする
let g:vimproc#download_windows_dll = 1

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
