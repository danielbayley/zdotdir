setopt all_export pipe_fail glob_assign

typeset -U path fpath
source /etc/profile
source <(brew shellenv)

PREFIX=${HOMEBREW_PREFIX:-/usr}

alias .=source
source() for __file ($@) builtin source $__file

source {$PREFIX/share/zsh-*,$ZDOTDIR/source}/*.env(.f[u-x]N)

unsetopt all_export
