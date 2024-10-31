import os

#CWD
CWD = os.getcwd()

#Home
HOME = os.path.expanduser("~")

#XDG Base Directory
XDG_CONFIG_HOME = os.path.join(HOME, ".config")
XDG_CACHE_HOME = os.path.join(HOME, ".cache")
XDG_STATE_HOME = os.path.join(HOME, ".local", "state")

if not os.path.exists(XDG_CONFIG_HOME):
    print("🔨 create $XDG_CONFIG_HOME")
    os.mkdir(XDG_CONFIG_HOME)

if not os.path.exists(XDG_CACHE_HOME):
    print("🔨 create $XDG_CACHE_HOME")
    os.mkdir(XDG_CACHE_HOME)

if not os.path.exists(XDG_STATE_HOME):
    print("🔨 create $XDG_STATE_HOME")
    os.mkdir(XDG_STATE_HOME)


print("START ... 🚗")

XDG_CONFIG_LIST = [
        "nvim",
        "wezterm",
        "git",
        "zsh",
    ]
for conf in XDG_CONFIG_LIST:
    src = os.path.join(CWD, ".config", conf)
    if os.path.exists(src):
        dst = os.path.join(XDG_CONFIG_HOME, conf)
        print(f"add symbolic link {src} -> {dst}")
        os.unlink(dst) if os.path.islink(dst) else None
        os.symlink(src, dst)

HOME_CONFIG_LIST = [
        ".zshenv"
        ]
for conf in HOME_CONFIG_LIST:
    src = os.path.join(CWD, conf)
    if os.path.exists(src):
        dst = os.path.join(HOME, conf)
        print(f"add symbolic link {src} -> {dst}")
        os.unlink(dst) if os.path.islink(dst) else None
        os.symlink(src, dst)


print("🎉 FINISH 🎉")

# print("""
# 🔨 Next -> Setup Nushell as login shell if it haven't done yet.
#
#     > 
#     > cat /etc/shells
#     > echo $(which nu) | sudo tee -a /etc/shells
#     > chsh -s $(which nu)
# """)
