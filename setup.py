import os

#CWD
CWD = os.getcwd()

#Home
HOME = os.environ["HOME"]

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

# Add $XDG_CONFIG_HOME
CONFIG_LIST = [
        "nvim",
        "wezterm",
        "git"
    ]
for conf in CONFIG_LIST:
    src = os.path.join(CWD, ".config", conf)
    if os.path.exists(src):
        dst = os.path.join(XDG_CONFIG_HOME, conf)
        print(f"add symbolic link {src} -> {dst}")
        os.unlink(dst) if os.path.islink(dst) else None
        os.symlink(src, dst)

print("🎉 FINISH 🎉")
