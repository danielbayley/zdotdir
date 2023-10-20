mkdir $HISTFILE:h

setopt append_history
setopt hist_{no_store,reduce_blanks,ignore_space}
if (($+HISTTIMEFORMAT))
then setopt extended_history hist_find_no_dups
else setopt hist_ignore_all_dups
fi

bindkey ' ' magic-space

if (($+commands[zsh-history-enquirer])) then
  autoload history_enquire
  history_enquire
fi
