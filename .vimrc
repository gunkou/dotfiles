"" ============================================================================
"" neobundle
"" ============================================================================
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    " vi との互換性OFF
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundle 管理開始（プラグインインストールディレクトリを指定）
call neobundle#begin(expand('~/.vim/bundle/'))

" NeoBundle 自体を管理
NeoBundleFetch 'Shougo/neobundle.vim'

"" ----------------------------------------------------------------------------
"" NeoBundle install packages
"" :NeoBundleInstall :NeoBundleUpdate :NeoBundleClean :NeoBundleList
"" ----------------------------------------------------------------------------
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" 補完
NeoBundle 'Shougo/neocomplete.vim'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" テキストオブジェクトの拡張
NeoBundle 'tpope/vim-surround'
" emmet
NeoBundle 'mattn/emmet-vim'
" css3のシンタックス拡張
NeoBundle 'hail2u/vim-css3-syntax'
" html5のシンタックス拡張
NeoBundle 'othree/html5.vim'
" JavaScriptのシンタックス拡張
NeoBundle 'taichouchou2/vim-javascript'
" html要素の閉じタグコメントアウト
NeoBundle 'kosei27/endtagcomment.vim'
" レジスタの履歴を取得・再利用する
NeoBundle 'LeafCage/yankround.vim'
" シンタックスチェック
NeoBundle 'scrooloose/syntastic'

" NeoBundle 管理終了
call neobundle#end()

" Required:
" Vim のファイルタイプ検出と、ファイルタイププラグインとインデントプラグインをオンにする設定
filetype plugin indent on

" インストールチェック
" NeoBundleCheck

"" ============================================================================
"" 各種設定 start
"" ============================================================================
syntax on

"" ----------------------------------------------------------------------------
"" set
"" ----------------------------------------------------------------------------
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

" 長い一行を全部表示させる
" set display=lastline

" 補完メニューの高さ
set pumheight=10

" 対応した括弧にカーソルが飛ぶようにする
set showmatch

" カーソルに飛ぶ時間を設定
set matchtime=1

"" ------------------------------------
"" 文字コード、改行コード
"" ------------------------------------
" デフォルトのエンコード
set encoding=utf-8

" 自動判別の設定 。列挙された文字コードの順番でファイルを開き、
" 上手くいった文字コードがファイル表示に採用
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

" 改行コード dos: <CR><NL>, unix: <NL>, mac: <CR>
set fileformats=unix,dos,mac

"" ------------------------------------
"" ステータスバー
"" ------------------------------------
" エディタ上部にタブバーを常に表示する設定
set showtabline=2

""
"" ステータスライン情報
""
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

" ファイル内の何％の位置にあるか
" set statusline+=%5P

"" ----------------------------------------------------------------------------
"" 入力画面
"" ----------------------------------------------------------------------------
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

" tabキーを押すとスペースが入力される
set expandtab

" 改行した時に自動でインデントします
set autoindent

" {があると次の行は自動で1段深く自動インデントしてくれる
set smartindent

" 拡張子ごとにインデントを変更
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.html setlocal noautoindent tabstop=1 softtabstop=0 shiftwidth=0
    autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.scss setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" tabstopとshiftwidthは同じ値に設定し、expandtabも有効にする
" noexpandtabの設定をしていたときに作られたファイルのタブはタブのままで半角スペースに置き換わっていないことがある
" 幅が細くならない時、expandtabになっているかをチェックし、ファイルのタブを削除し、タブを追加
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1

" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2

" 自動カラーを無効にする
let g:indent_guides_auto_colors=0

" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray

" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray

" ハイライト色の変化の幅
let g:indent_guides_color_change_percent=30

" ガイドの幅
let g:indent_guides_guide_size=1

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

"" ----------------------------------------------------------------------------
"" キーマップ設定
"" ----------------------------------------------------------------------------
" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 数字のインクリメント、デクリメントのキーマップ変更
nnoremap + <C-a>
nnoremap - <C-x>

"" ----------------------------------------------------------------------------
"" そのほか
"" ----------------------------------------------------------------------------
" カレントウィンドウのカレントディレクトリを変更
nnoremap <leader>. :lcd %:p:h<CR>

" Opens an edit command with the path of the currently edited file filled in
" noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled
" noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" ----------------------------------------------------------------------------
"" プラグインなど
"" ----------------------------------------------------------------------------
"" ------------------------------------
"" emmet
"" https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
"" ------------------------------------
let g:user_emmet_settings = {
\ 'variables': {
\ 'lang' : 'ja'
\ }
\}

"" ------------------------------------
"" syntastic
"" ------------------------------------
" ファイルオープン時にはチェックをしない
let g:syntastic_check_on_open = 0

" wq時にチェックを行わない
let g:syntastic_check_on_wq = 0

" エラー時のQuickfix設定
let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5

" チェックマーク
" let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'
" let g:syntastic_style_error_symbol = '✗'
" let g:syntastic_style_warning_symbol = '⚠'

" scssの設定
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_scss_scss_lint_args = '--config=%USERPROFILE%\dotfiles\.scss-lint.yml'

" JavaScriptの設定
let g:syntastic_javascript_checkers = ['jscs', 'jshint']
let g:syntastic_javascript_jscs_args = '--config=%USERPROFILE%\dotfiles\.jscsrc'
let g:syntastic_javascript_jshint_args = '--config=%USERPROFILE%\dotfiles\.jshintrc'

" 今のところ手動でチェック
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'passive_filetypes': ['scss', 'javascript'] }

" キーマップ
nnoremap <silent> sc :SyntasticCheck<CR>

"" ------------------------------------
"" nerdtree
"" http://qiita.com/zwirky/items/0209579a635b4f9c95ee
"" http://qiita.com/hide/items/77b9c1b0f29577d60397
"" ------------------------------------
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"" ------------------------------------
"" LeafCage/yankround.vim
"" ------------------------------------
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"" ============================================================================
"" 各種設定 end
"" ============================================================================
" filetypeの自動検出
filetype on
