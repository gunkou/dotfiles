# vim
## 環境構築手順
### windows

- vim
    - [vim-kaoriya](https://github.com/koron/vim-kaoriya/releases)

- プラグイン管理
    - [Dein.vim](https://github.com/Shougo/dein.vim)
        - ディレクトリ作成
        - クローン

```
.vim\dein\repos\github.com\Shougo\dein.vim

git clone https://github.com/Shougo/dein.vim
```

- ctagsインストール
    - [Win32版(バイナリのみ)](http://hp.vector.co.jp/authors/VA025040/ctags/) をダウンロードして、Vimのディレクトリに追加

- フォント
    - [Myrica](https://github.com/tomokuni/Myrica)

- シンボリックリンク

```
mklink %HOMEPATH%"\.gvimrc" %HOMEPATH%"\dotfiles\.gvimrc"
mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\dotfiles\.vimrc"
```

# そのほかの設定ファイル
