# https://zsh-manual.netlify.app/options#1621-changing-directories
setopt auto_cd chase_links
setopt auto_pushd pushd_{ignore_dups,to_HOME,minus,silent}

for __i ({2..6}) do
  printf -v __n        '.%.0s' {1..$__i}
  printf -v __parent '../%.0s' {2..${#__n}}
  alias {,cd}$__n="cd $__parent"
done

alias dirs='dirs -p'

if [ $TERM_PROGRAM = Apple_Terminal ] && $0:h:h/libexec/terminal-tabs.js
then
  defaults read com.apple.finder NewWindowTargetPath 2> /dev/null | read
  pushd ${REPLY#file://}
fi