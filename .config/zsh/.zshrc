export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

### START zsh ###
export HISTFILE="$XDG_STATE_HOME/zsh/zsh_history"
export HISTSIZE=20000
export SAVEHIST=10000

setopt hist_ignore_dups
### END ###

### SET LANG to UTF-8 ###
export LANG=ja_JP.UTF-8
### END ###

### START zim ###
export ZIM_CONFIG_FILE="$XDG_CONFIG_HOME/zsh/.zimrc"
export ZIM_HOME="$XDG_CACHE_HOME/.zim"

# Default Editor
export EDITOR="$(which nvim)"

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
#
# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi

source ${ZIM_HOME}/init.zsh
### END ###

[ -f "$ZDOTDIR/.zshrc.alias" ] && source "$ZDOTDIR/.zshrc.alias"

[ -f $ZDOTDIR/.zshrc.fn ] && source $ZDOTDIR/.zshrc.fn

[ -f $ZDOTDIR/.zshrc.local ] && source $ZDOTDIR/.zshrc.local

# bun completions
[ -s "/Users/t.daisuke/.bun/_bun" ] && source "/Users/t.daisuke/.bun/_bun"
