setopt share_history inc_append_history
setopt hist_{ignore_all_dups,save_no_dups}
setopt hist_{ignore_space,reduce_blanks,no_store}

bindkey ' ' magic-space

export HISTFILE=$XDG_CACHE_HOME/zsh/zshistory
mkdir -p $HISTFILE:h
export HISTSIZE=240
export SAVEHIST=$HISTSIZE
export HISTORY_IGNORE='(reload|rm|cd|..|...|....|pushd|popd|ls|pwd|exit)'
