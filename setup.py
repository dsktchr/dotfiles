import os

CWD = os.getcwd()
HOME_DIR = os.environ["HOME"]
XDG_CONFIG_HOME = os.path.join(HOME_DIR, ".config")

if not HOME_DIR:
    print("HOME_DIR is not found ... check your $HOME environment variable")
    os.error()

if not os.path.isdir(XDG_CONFIG_HOME):
    print("check XDG_CONFIG_HOME. `.config` must be a directory")
    os.error()

print("START SETUP ... 🚗")

def get_xdg_config_name(dirname):
    return os.path.join(XDG_CONFIG_HOME, dirname)

def set_xdg_config_home(src, dst):
    if not os.path.exists(NEOVIM_CONFIG):
        print(f"add symbolic link. src = {src}, dst = {dst}")
        os.symlink(src, dst)
    else:
        #シンボリックリンクをセットしたいターゲットが
        #シンボリックリンクでないとき、そもそも既存のXDG_CONFIG_HOME
        #が間違っていないかチェック必要
        if not os.path.islink(dst):
            print(f"{dst} must be symlink")
            os.error()

#set Neovim conf
_NVIM = "nvim"
CWD_NEOVIM_CONFIG = os.path.join(CWD, _NVIM)
NEOVIM_CONFIG = get_xdg_config_name(_NVIM)

set_xdg_config_home(CWD_NEOVIM_CONFIG, NEOVIM_CONFIG)

#set Wezterm conf
_WEZTERM = "wezterm"
CWD_WEZTERM_CONFIG = os.path.join(CWD, _WEZTERM)
WEZTERM_CONFIG = get_xdg_config_name(_WEZTERM)

set_xdg_config_home(CWD_WEZTERM_CONFIG, WEZTERM_CONFIG)

print("🎉 FINISH SETUP 🎉")
