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

`~/dev/src/github.com/` の下では、`.mise.toml` が `gh auth token -u 70-10` で取ったトークンを `GH_TOKEN` に入れる。mise は trust していない設定ファイルを読まないので、`install.sh` のあとに一度だけ次を実行する。`gh` にログインしていないと、このディレクトリの下で mise がエラーになるため、先にログインする。

```sh
gh auth login
mise trust ~/dev/src/github.com/.mise.toml
```
