# dotfiles

Apple Silicon Mac の環境を mise でまとめて再現する。

## 導入

事前に App Store へサインインしてから実行する。

```sh
zsh -c "$(curl -fsSL https://dotfiles.70-10.net)"
```

`install.sh` が次を順に行う。何度実行してもよい。

1. Command Line Tools と Homebrew を入れる
2. このリポジトリを `~/dev/src/github.com/70-10/dotfiles` に clone する
3. mise を入れ、`.config/mise/config.toml` のパッケージ・macOS 設定・ツールを適用する
4. 設定ファイルをホームにリンクする

既存の Mac でリンク先にファイルがある場合は止まる。既存のファイルを退避してから再実行する。

## zsh の追加設定

`.config/zsh/` は mise が `~/.config/zsh` にリンクし、Sheldon がそこから設定を読み込む。

以前の `zsh/` 配置を使っている環境では、リポジトリを更新した後に次を実行する。
リンク先に既存のファイルやディレクトリがある場合は、退避してから再実行する。

```sh
mise dotfiles apply ~/.config/zsh
sheldon source --relock > /dev/null
```

その後、新しい対話シェルを起動する。
