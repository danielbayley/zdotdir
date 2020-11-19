setopt null_glob

for REPLY ($ZDOTDIR/source/*.zsh) source $REPLY

alias autoload='autoload -Uz'
for REPLY ($^fpath/*.zwc) autoload $REPLY:t:r

autoload add-zsh-hook compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump

for REPLY ($HOMEBREW_PREFIX/share/zsh-*/zsh-*.zsh) source $REPLY
unset REPLY
