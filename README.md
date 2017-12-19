# vim
## 環境構築手順
- vim
    - [vim-kaoriya](https://github.com/koron/vim-kaoriya/releases)

- プラグイン管理
    - [Dein.vim](https://github.com/Shougo/dein.vim)
        - ディレクトリ作成
```
mkdir ~/.vim/dein
```
        - インストール
```
$ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.vim/dein
```

        - プラグインのインストール
```
:call dein#install()
```

- ctagsインストール
    - Windows
        - [Win32版(バイナリのみ)](http://hp.vector.co.jp/authors/VA025040/ctags/) をダウンロードして、Vimのディレクトリに追加

- フォント
    - Windows
        - [Myrica](https://github.com/tomokuni/Myrica)

- シンボリックリンク
    - Windows
```
mklink %HOMEPATH%"\.gvimrc" %HOMEPATH%"\dotfiles\.gvimrc"
mklink %HOMEPATH%"\.vimrc" %HOMEPATH%"\dotfiles\.vimrc"
```
    - Linux
```
$ ln -sf ~/dotfiles/.vimrc ~/.vimrc
$ ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
```

- そのほか
    - undo用ファルダ
```
mkdir ~/.vim/undo
```

# そのほかの設定ファイル
