#! /bin/zsh --no-rcs
case $1 in
  list|ls|ll)
      __list() { command code --list-extensions --show-versions | sed 's|@|\t|g' | column -t }
      if (($+commands[bat]))
      then __list | bat --plain --language env
      else __list
      fi;;

   install|i) command code --install-extension ${@:2};;
           *) command code $@
esac
