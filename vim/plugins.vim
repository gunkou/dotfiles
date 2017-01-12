" ------------------------------------
" indent-guides
" ------------------------------------
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


" ------------------------------------
" emmet
" ------------------------------------
let g:user_emmet_settings = {
\ 'variables': {
\ 'lang' : 'ja'
\ }
\}


" ------------------------------------
" syntastic
" ------------------------------------
" ファイルオープン時にはチェックをしない
let g:syntastic_check_on_open = 0

" wq時にチェックを行わない
let g:syntastic_check_on_wq = 0

" エラー時のQuickfix設定
let g:syntastic_auto_loc_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5

" htmlの設定
let g:syntastic_html_checkers = ['htmlhint']
let g:syntastic_html_htmlhint_args = '--config=%USERPROFILE%\dotfiles\.htmlhintrc'

" scssの設定
let g:syntastic_scss_checkers = ['stylelint', 'scss_lint']
let g:syntastic_scss_scss_lint_args = '--config=%USERPROFILE%\dotfiles\.scss-lint.yml'
let g:syntastic_scss_stylelint_args = '--config=%USERPROFILE%\dotfiles\.stylelintrc'

" cssの設定
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_css_stylelint_args = '--config=%USERPROFILE%\dotfiles\.stylelintrc'

" JavaScriptの設定
let g:syntastic_javascript_checkers = ['jscs', 'jshint', 'eslint']
let g:syntastic_javascript_eslint_args = '--config=%USERPROFILE%\dotfiles\.eslintrc'
let g:syntastic_javascript_jscs_args = '--config=%USERPROFILE%\dotfiles\.jscsrc'
let g:syntastic_javascript_jshint_args = '--config=%USERPROFILE%\dotfiles\.jshintrc'

" 手動でチェック
let g:syntastic_mode_map = { 'mode': 'active',
  \ 'passive_filetypes': ['html','xhtml','scss','css','javascript'] }

" キーマップ
nnoremap <silent> sc :SyntasticCheck<CR>


" ------------------------------------
" nerdtree
" ------------------------------------
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>


" ------------------------------------
" LeafCage/yankround.vim
" ------------------------------------
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

" html要素の閉じタグコメントアウト
" kosei27/endtagcomment.vim'
" こういうHTMLがあったときに
" <div id="hoge" class="fuga">
" ...
" </div>
"
" 実行するとこうなる
" <div id="hoge" class="fuga">
" ...
" <!-- /div#hoge.fuga --></div>
"
" ----------
" update:2010-12-08 @kosei27
"
" ,ti でidのみを出力
" ,tc でclassのみを出力(",tt" ",t" も同様)
" ,ta でidとclassを出力
" ,t<Space> でコメント内のテキストの前後の空白をトグル
" <!--/hoge-->  <->  <!-- /hoge -->

function! Endtagcomment(type)
    let reg_save = @@

    try
        silent normal vaty
    catch
        execute "normal \<Esc>"
        echohl ErrorMsg
        echo 'no match html tags'
        echohl None
        return
    endtry

    let html = @@

    let start_tag = matchstr(html, '\v(\<.{-}\>)')
    let tag_name  = matchstr(start_tag, '\v([a-zA-Z]+)')

    let comment_type = a:type
    let comment_space = g:endtagcomment_space
    let firstclass_symbol = g:endtagcomment_firstclass_symbol

    let id = ''
    let id_match = matchlist(start_tag, '\vid\=["'']([^"'']+)["'']')
    if exists('id_match[1]')
        let id = '#' . id_match[1]
    endif

    let class = ''
    let class_match = matchlist(start_tag, '\vclass\=["'']([^"'']+)["'']')
    if exists('class_match[1]')
        "let class = '.' . join(split(class_match[1], '\v\s+'), '.')
        let class = join(split(class_match[1], '\v\s+'), '.')
    endif

    execute "normal `>va<\<Esc>`<"

    if l:comment_type == 'id'
        let g:endtagcommentFormat = '<!--%comment_space/%id%comment_space-->'
    elseif l:comment_type == 'class'
        let g:endtagcommentFormat = '<!--%comment_space/%firstclass_symbol%class%comment_space-->'
    elseif l:comment_type == 'id_class'
        let g:endtagcommentFormat = '<!--%comment_space/%id.%class%comment_space-->'
    elseif l:comment_type == 'tag_id_class'
        let g:endtagcommentFormat = '<!--%comment_space/%tag_name%id.%class%comment_space-->'
    endif

    let comment = g:endtagcommentFormat
    let comment = substitute(comment, '%comment_space', comment_space, 'g')
    let comment = substitute(comment, '%firstclass_symbol', firstclass_symbol, 'g')
    let comment = substitute(comment, '%tag_name', tag_name, 'g')
    let comment = substitute(comment, '%id', id, 'g')
    let comment = substitute(comment, '%class', class, 'g')

    let @@ = comment

    normal ""P

    let @@ = reg_save
endfunction

"let g:endtagcommentFormat = '<!-- /%tag_name%id%class -->'

"" keymap
nnoremap ,ti  :<C-u>call Endtagcomment('id')<CR>
nnoremap ,tc  :<C-u>call Endtagcomment('class')<CR>
nnoremap ,ta  :<C-u>call Endtagcomment('id_class')<CR>
nnoremap ,tg  :<C-u>call Endtagcomment('tag_id_class')<CR>

nmap ,tt  :<C-u>normal ,tc<CR>

" コメント内のテキストの前後の空白
let g:endtagcomment_space = ''
"" 有無をトグル
function! Endtagcomment_space_toggle()
  let comment_space = g:endtagcomment_space
  if l:comment_space == ''
    let g:endtagcomment_space = ' '
  else
    let g:endtagcomment_space = ''
  endif
endfunction
""" keymap
nnoremap <silent> ,t<Space>  :<C-u>call Endtagcomment_space_toggle()<CR>

" コメント内のテキストの最初のclass名の「.」
let g:endtagcomment_firstclass_symbol = ''
"" 有無をトグル（id+classの場合は固定で「.」がつきます）
function! Endtagcomment_firstclass_symbol_toggle()
  let firstclass_symbol = g:endtagcomment_firstclass_symbol
  if l:firstclass_symbol == ''
    let g:endtagcomment_firstclass_symbol = '.'
  else
    let g:endtagcomment_firstclass_symbol = ''
  endif
endfunction
"" keymap
nnoremap <silent> ,t.  :<C-u>call Endtagcomment_firstclass_symbol_toggle()<CR>


" ------------------------------------
" マークダウン
" ------------------------------------
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    let g:previm_open_cmd = 'C:\\Program\ Files\ (x86)\\Google\\Chrome\\Application\\chrome.exe'
augroup END


" ------------------------------------
" open-browser.vim
" ------------------------------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)


" ------------------------------------
" thinca/vim-localrc 設定例
" ------------------------------------
" 1) ローカル: .local.vimrc作成
" 2) カレントディレクトに移動: lcd <sfile>:h
" 3) タブの設定
" setlocal noautoindent tabstop=1 softtabstop=0 shiftwidth=0
" augroup fileTypeIndent
"    autocmd!
"    autocmd BufNewFile,BufRead *.html setlocal noautoindent tabstop=1 softtabstop=0 shiftwidth=0
" augroup END


" ------------------------------------
" vim-easy-align
" ------------------------------------
" ヴィジュアルモードで選択し，easy-align 呼んで整形．(e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" easy-align を呼んだ上で，移動したりテキストオブジェクトを指定して整形．(e.g. gaip)
nmap ga <Plug>(EasyAlign)


" ------------------------------------
" vim-precious
" ------------------------------------
let g:context_filetype#filetypes = {
    \ 'html': [
    \   {
    \    'start':
    \     '<script\%( [^>]*\)\?\%( [^>]*\)\?>',
    \    'end': '</script>', 'filetype': 'javascript',
    \   },
    \   {
    \    'start': '<style\%( [^>]*\)\?\%( [^>]*\)\?>',
    \    'end': '</style>', 'filetype': 'css',
    \   },
    \   {
    \    'start': '<?php\?',
    \    'end': '?>', 'filetype': 'php',
    \   }
    \ ],}
" }}}

" insert mode に入った時に 'filetype' を切り換える。
" カーソル移動時の自動切り替えを無効化
let g:precious_enable_switch_CursorMoved = {
 \ "*" : 0
 \}
let g:precious_enable_switch_CursorMoved_i = {
 \ "*" : 0
 \}

" insert に入った時にスイッチし、抜けた時に元に戻す
augroup test
  autocmd!
  autocmd InsertEnter * :PreciousSwitch
  autocmd InsertLeave * :PreciousReset
augroup END

" ------------------------------------
" vim-quickhl
" ------------------------------------
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" ------------------------------------
" vim-singleton
" ------------------------------------
call singleton#enable()

" ------------------------------------
" vim-jsbeautify
" ------------------------------------
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
