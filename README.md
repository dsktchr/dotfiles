# 方針
XDG Base Directory Specificationに従う
https://wiki.archlinux.jp/index.php/XDG_Base_Directory

| DIR             | Path                 | Memo                             |
| --------------- | -------------------- | -------------------------------- |
| XDG_CONFIG_HOME | `$HOME/.config`      | 基本ここにツール類の設定を入れる |
| XDG_CASH_HOME   | `$HOME/.cache`       | キャッシュ周りはここに           |
| XDG_STATE_HOME  | `$HOME/.local/state` | ログとか履歴とか                 |


# Tools
- Nushell (shell)
- Homebrew (linuxbrew)
- Neovim (editor)
- Wezterm (terminal)

# Setup
```shell
#step1
$ python3 ./install.py

#step2
$ python3 ./setup.py

```

# Custom
| Tool | Path | Memo |
| --------------- | --------------- | --------------- |
| Nushell | `.config/nushell/env.local.nu` | local(端末特有)の環境変数を設定|


