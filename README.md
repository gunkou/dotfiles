# Windows
- [chocolatey](https://chocolatey.org/)をインストール
    - `./windows/`に移動して下記実行
    ```
    choco install package.config
    ```


# Mac
- [Homebrew](https://brew.sh/index_ja.html)をインストール
    - `./mac/`に移動して下記実行
    ```
    $ brew tap Homebrew/bundle
    $ brew bundle
    ```


# vim
[vim-kaoriya](https://github.com/koron/vim-kaoriya/releases)をインストール

- プラグイン管理
    - [Dein.vim](https://github.com/Shougo/dein.vim)
        - ディレクトリを作成
        ```
        mkdir ~/.vim/dein
        ```
        - Dein.vimをインストール
        ```
        $ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
        $ sh ./installer.sh ~/.vim/dein
        ```
        - プラグインをインストール
        ```
        :call dein#install()
        ```
- ctagsをインストール
    - Windows
        - [Win32版（バイナリのみ）](http://hp.vector.co.jp/authors/VA025040/ctags/) をダウンロードして、Vimのディレクトリに追加
    - mac
        - `./mac/Brewfile`に記述されている
- フォントをインストール
    - Windows
        - [Myrica](https://github.com/tomokuni/Myrica)
- シンボリックリンクの作成
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
    - undo用ファルダの作成
    ```
    mkdir ~/.vim/undo
    ```
