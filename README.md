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

## 変更の反映

| 変更したもの | 反映 |
|---|---|
| リンク済みの設定ファイル | 不要（リンクなので即時） |
| `[bootstrap.packages]` | `mise bootstrap packages apply` |
| `[dotfiles]` | `mise dotfiles apply` |
| それ以外 | `mise bootstrap` |

## 構成

- `.config/mise/config.toml`: パッケージ・リンク・macOS 設定の宣言
- `install.sh`: 導入スクリプト（GitHub Actions で Pages に配信）
- `zsh/`: Sheldon が読む zsh の設定
- `Cornix.vil`: Cornix キーボードのキー割り当て
