alias vim=nvim
alias cddot='cd $HOME/dotfiles'

[ -f $PWD/.zshrc.local ] && source $PWD/.zshrc.local

eval "$(starship init zsh)"
