# Windows
- [chocolatey](https://chocolatey.org/)をインストール
    - `./windows/`に移動して下記実行
    ```
    choco install chocolatey.config 
    ```

Gitをインストールするときに環境変数PATHに`C:\Program Files\Git\cmd`が追加されているか確認すること

これが追加されていないと、deinを使用してvimのプラグインをインストールできない


# Mac
- [Homebrew](https://brew.sh/index_ja.html)をインストール
    - `./mac/`に移動して下記実行
    ```
    $ brew tap Homebrew/bundle
    $ brew bundle
    ```

# Git

- [使い始める - 最初のGitの構成](https://git-scm.com/book/ja/v2/使い始める-最初のGitの構成)

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
    - mac
        - [Ricty Diminished](http://www.rs.tus.ac.jp/yyusa/ricty_diminished.html)
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

# Neovim(Windows)

chocolateyを使用して以下をインストールする

```
choco install neovim
choco install ruby
choco install python3 --params "/InstallDir:C:\tools\python3"
choco install python2 --params "/InstallDir:C:\tools\python2"
```

[Microsoft Visual C++ Build Tools](https://www.microsoft.com/ja-JP/download/confirmation.aspx?id=48159) のインストール


環境変数の設定

```
$XDG_CONFIG_HOME: $HOME/.config
```

設定ファイルを格納するディレクトリを作成

```
mkdir $XDG_CONFIG_HOME/nvim
```

管理者権限でコマンドプロンプトを立ち上げてシンボリックリンクの作成

```
mklink %HOMEPATH%"\.config/nvim/init.vim" %HOMEPATH%\dotfiles\.vimrc"
mklink %HOMEPATH%"\.config\nvim\ginit.vim" %HOMEPATH%"\dotfiles\.gvimrc"
```

# そのほか
- vimのundo用ファルダの作成
```
mkdir ~/.vim/undo
```
- nodebrewの設定
```
nodebrew setup
```

