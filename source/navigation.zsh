setopt auto_cd chase_links
setopt auto_pushd pushd_{ignore_dups,to_HOME,silent}

alias cd=pushd

for i ({2..6}) do
  printf -v n        '.%.0s' {1..$i}
  printf -v parent '../%.0s' {2..${#n}}
  alias {,cd}$n="cd $parent"
  unset n parent
done
