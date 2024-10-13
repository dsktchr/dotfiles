import subprocess

INSTALL_TOOLS = [
        "openssl",
        "cmake",
        # "nushell",
        "neovim",
        "fzf",
        "ripgrep",
        "zellij",
    ]

for tool in INSTALL_TOOLS:
    print(f"install start -> `{tool}`")
    subprocess.run(["brew", "install", tool], check=True)
    print("\n")
