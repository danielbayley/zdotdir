if ((#))
then command env $@ | sort
elif (($+commands[bat])) then export | bat --plain --language zsh #--paging never #typeset -gx #-T #| sort #&& brew config
else export
fi
