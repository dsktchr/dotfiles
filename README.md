# 方針
XDG Base Directory Specificationに従う
https://wiki.archlinux.jp/index.php/XDG_Base_Directory

| DIR             | Path                 | Memo                             |
| --------------- | -------------------- | -------------------------------- |
| XDG_CONFIG_HOME | `$HOME/.config`      | 基本ここにツール類の設定を入れる |
| XDG_CASH_HOME   | `$HOME/.cache`       | キャッシュ周りはここに           |
| XDG_STATE_HOME  | `$HOME/.local/state` | ログとか履歴とか                 |


# Tools
- Wezterm (terminal)
- Zsh (shell)
- Zim (zsh framework)
- Homebrew or Linuxbrew (package manager)
- Neovim (editor)

# Setup
```shell
# step1
# install `Tools`
> python3 ./install.py

# step2
# setup `Tools`
> python3 ./setup.py

# step3 (on WSL2)
# change default shell
> echo $(which zsh) | sudo tee -a /etc/shells
> chsh -s $(which zsh)
```

# Custom
| Tool            | Path                           | Memo                            |
| --------------- | -------------------------      | ------------------------------  |
| Zsh             | `.config/zsh/.zshenv.local`    | local(端末特有)の環境変数を設定 |
| Zsh             | `.config/zsh/.zprofile.local`  | local(端末特有)のaliasなどを設定|


