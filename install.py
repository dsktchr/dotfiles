import subprocess

INSTALL_TOOLS = [
        "neovim",
        "fzf",
        "ripgrep",
    ]

for tool in INSTALL_TOOLS:
    print(f"install start -> `{tool}`")
    subprocess.run(["brew", "install", tool], check=True)
