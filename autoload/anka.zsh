#! /bin/zsh --no-rcs
if ((!$+commands[anka])) return

: ${__list:=command anka list --field name -f status}
__bat='bat --plain --language python'

case $1 in
    --version|-v) command anka version;;
         help|-h) command anka --help;;

              ll) __list+=' -f creation_date -f access_date' anka list ${@:2};;
         list|ls)
              if (($+commands[bat]))
              then $=__list ${@:2} | $=__bat
              else $=__list ${@:2}
              fi;;

       show|info) __show="command anka show ${*:2}"
              if (($+commands[bat]))
              then $=__show | $=__bat
              else $=__show
              fi;;

           desc*) __describe="command anka describe ${*:2}"
              if (($+commands[yq]))
              then command anka --machine-readable describe ${@:2} | yq .body --prettyPrint
              elif (($+commands[bat]))
              then $=__describe | $=__bat
              else $=__describe
              fi;;

            view) anka start --$@ && ${ZDOTDIR:-$0:h:h}/libexec/anka.js;;
           start) __start="command anka start ${*:2}"
              if (($+commands[bat]))
              then $=__start | $=__bat
              else $=__start
              fi;;

            stop) command anka $@ --force;;
         restart) command anka reboot ${@:2};;
  up(date|grade)) command anka start $2 --update-addons
                  command anka run   $2 softwareupdate --install ${${@:3}:--recommended};;

          rm|del) command anka delete   ${@:2} --yes;;
            reg*) command anka registry ${@:2};;
               *) command anka $@
esac
