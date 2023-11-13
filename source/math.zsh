# https://zsh-manual.netlify.app/user-contributions#2610-mathematical-functions
zmodload zsh/mathfunc

autoload zcalc
calc() zcalc ${=1:+-e "$*"}
alias zcalc=calc
export ZCALC_HISTFILE=$HISTFILE:h/zcalc_history

alias count='wc -l'

if (($+commands[numi-cli])) alias numi=numi-cli
