alias egrep='grep --extended-regexp'
alias grep=egrep
alias envgrep='env | grep'

# https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#user-guide
if (($+commands[rg])) then
  alias {,e}grep=rg

  # https://github.com/eth-p/bat-extras/blob/master/doc/batgrep.md#options
  if (($+commands[batgrep])) then
    alias batgrep='batgrep --no-separator --context 0'
    aliases[grep]=batgrep
    alias rg=batgrep
  fi
fi
