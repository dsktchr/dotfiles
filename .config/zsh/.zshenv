typeset -U path PATH

path+=(
  # linuxbrew
  /home/linuxbrew/.linuxbrew/bin
  # for Rust
  /home/linuxbrew/.linuxbrew/opt/rustup/bin
  # cargo
  $HOME/.cargo/bin
)
# linuxbrew
# export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
#
# # for Rust
# export PATH="/home/linuxbrew/.linuxbrew/opt/rustup/bin:$PATH"
#
# # cargo
# export PATH="$HOME/.cargo/bin:$PATH"
#
export PKG_CONFIG_PATH="/usr/lib/pkgconfig"

export PATH

[ -f $$ZDOTDIR/.zshenv.local ] && source $ZDOTDIR/.zshenv.local
