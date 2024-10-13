# linuxbrew
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

# for Rust
export PATH="/home/linuxbrew/.linuxbrew/opt/rustup/bin:$PATH"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

export PKG_CONFIG_PATH="/usr/lib/pkgconfig"

[ -f $PWD/.zshenv.local ] && source ./.zshenv.local
