setopt all_export pipe_fail glob_assign

for REPLY ($ZDOTDIR/source/*.env) source $REPLY

unset REPLY
unsetopt all_export
