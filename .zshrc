alias vim="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# # zsh-completions
# if type brew &>/dev/null; then
# 	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
#
# 	autoload -Uz compinit
# 	compinit
# fi
#
# init starship
eval "$(starship init zsh)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
