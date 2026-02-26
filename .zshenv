export ZDOTDIR="$HOME/.config/zsh"

print "./.zshenv set ZDOTDIR to $ZDOTDIR"

typeset -U path PATH
path+=(
  # linuxbrew
  /home/linuxbrew/.linuxbrew/bin
  # for Rust
  /home/linuxbrew/.linuxbrew/opt/rustup/bin
  # cargo
  $HOME/.cargo/bin
)

export PKG_CONFIG_PATH="/usr/lib/pkgconfig"

export PATH

# skip_global_compinit=1

[ -f $$ZDOTDIR/.zshenv.local ] && source $ZDOTDIR/.zshenv.local
