alias vim=nvim
alias cddot='cd $HOME/dotfiles'

[ -f $PWD/.zprofile.local ] && source ./.zprofile.local

eval "$(starship init zsh)"
