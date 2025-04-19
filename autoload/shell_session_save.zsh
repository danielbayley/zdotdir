# FIXME https://apple.stackexchange.com/a/478437

# Save the current state.
if [ -n $SHELL_SESSION_FILE ]
then
  local save_lock_file=$SHELL_SESSION_DIR/_saving_lockfile
  if /usr/bin/shlock -f $save_lock_file -p $$
  then
    echo -ne '\nSaving session...' >&2
    (umask 077; echo 'echo Restored session: "$(/bin/date -r '$(/bin/date +%s)')"' >| $SHELL_SESSION_FILE)

    # Call user-supplied hook functions to let them save state.
    whence shell_session_save_user_state >/dev/null && shell_session_save_user_state $SHELL_SESSION_FILE
    local f
    for f in $shell_session_save_user_state_functions
    do $f $SHELL_SESSION_FILE
    done

    shell_session_history_allowed && shell_session_save_history
    echo 'completed.' >&2
    /bin/rm $save_lock_file
  fi
fi
