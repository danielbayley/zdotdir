# https://zsh-manual.netlify.app/options#16-options
setopt extended_glob pushdsilent
alias opt{ion,}s=setopt

alias autoload='autoload -Uz'
alias zcompile='zcompile -Rz'

autoload $fpath[1]/^(_|prompt_|*.)*(-.N:t:r)

__autoload=(${ZDOTDIR:=$0:h}/autoload/*.*(xN))
unset -f $^__autoload:t:r 2> /dev/null
autoload $^__autoload:t:r

if ([ ! -r $fpath[1].zwc ]||[ $__autoload[1]:h/*(.om[1]) -nt $fpath[1].zwc ]) then
  mktemp -d -t zcompile | read __tmp
  for __function ($__autoload) cp $__function $__tmp/$__function:t:r
  pushd $__tmp
  if (($+__autoload)) zcompile $fpath[1] *
  popd
  rm -rf $__tmp
fi

source $fpath[1]:h-*/*.zsh(xN) ${ZDOTDIR:=$0:h}/source/*.zsh(.f[u-x]N)

# https://zsh-manual.netlify.app/completion-system#2021-use-of-compinit
autoload compinit
compinit -d $ZSH_CACHE_DIR/zcompdump

add-zsh-hook precmd function() {
  __pattern='__+([a-z])'
  unalias    -m $__pattern
  unfunction -m $__pattern
  unset      -m $__pattern REPLY
}
