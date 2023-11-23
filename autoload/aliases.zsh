__bat='bat --plain --language zsh'

case $1 in
  -[gmrsL])
    if (($+commands[bat]))
    then builtin alias $@ | $=__bat
    else builtin alias $@
    fi;;

  --verbose|-v)
    PROMPT4=$'%x:%I:\n' zsh --interactive --xtrace -c : 2>&1 |
    sed "s|$HOME|~|;s|$ZDOTDIR|ZDOTDIR|;s|$PREFIX|PREFIX|;s|'||g" |
    =batgrep --no-separator --before-context 1 --after-context 0 "alias ${${*:2}:-[a-z-]+=}" |
    $=__bat;;

  *) __list() {
      builtin alias -g #lobal
      echo
      builtin alias -r #egular
      echo
      builtin alias -s #uffix
    }
    if (($+commands[bat]))
    then __list | $=__bat
    else __list
    fi
esac
