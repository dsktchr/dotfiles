print "Setup .zshrc"


### START XDG Base Directory Specification ###

if [[ -z $XDG_CONFIG_HOME ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -z $XDG_CACHE_HOME ]]; then
  export XDG_CACHE_HOME="$HOME/.cache"
fi

if [[ -z $XDG_DATA_HOME ]]; then
  export XDG_DATA_HOME="$HOME/.local/share"
fi


if [[ -z $XDG_STATE_HOME ]]; then
  export XDG_STATE_HOME="$HOME/.local/state"
fi

### END ####

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


if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  print "Downloading zimfw plugin manager to ${ZIM_HOME}/zimfw.zsh"

  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  print "Installing missing zimfw modules and updating ${ZIM_HOME}/init.zsh"

  source ${ZIM_HOME}/zimfw.zsh init -q
fi


# run before compinit
eval "$(git gtr completion zsh | grep -v autoload)"

print "Loading zimfw plugin manager from ${ZIM_HOME}/init.zsh"
source ${ZIM_HOME}/init.zsh


if [[ -f "$ZDOTDIR/.zshrc.alias" ]]; then
  print "Loading aliases from $ZDOTDIR/.zshrc.alias"
  source "$ZDOTDIR/.zshrc.alias"
fi

if [[ -f $ZDOTDIR/.zshrc.fn ]]; then
  print "Loading functions from $ZDOTDIR/.zshrc.fn"
  source $ZDOTDIR/.zshrc.fn
fi 

if [[ -f $ZDOTDIR/.zshrc.local ]]; then
  print "Loading local settings from $ZDOTDIR/.zshrc.local"
  source $ZDOTDIR/.zshrc.local
fi

# bun completions
[ -s "/Users/t.daisuke/.bun/_bun" ] && source "/Users/t.daisuke/.bun/_bun"

