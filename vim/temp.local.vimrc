" 本ファイルの位置をプロジェクトのルートディレクトリにする
" lcd <sfile>:h

" タブの設定
" setlocal noautoindent tabstop=1 softtabstop=0 shiftwidth=0
" augroup fileTypeIndent
"    autocmd!
"    autocmd BufNewFile,BufRead *.html setlocal noautoindent tabstop=1 softtabstop=0 shiftwidth=0
" augroup END

" set noexpandtab
" set tabstop=4
" set shiftwidth=4

" リンターの無効化
" let g:ale_enabled = 0

" リンターのリストを表示する
" let g:ale_open_list = 1

" 文字コード指定
" set fenc=cp932
