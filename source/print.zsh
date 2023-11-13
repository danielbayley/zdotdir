alias p=print
alias p{{-,}l,p}='print -l'
alias l=list
list() { print -l $@ | sort }
alias e=echo

alias {fpath,FPATH}='print -l $fpath'
alias   {path,PATH}='print -l $path'

alias {where,whence,type}=which
alias cmd=command
alias commands='print -l $commands | sort' cmds=commands

if (($+commands[bat])) then
  __bat='bat --plain --language hs'
      aliases[path]+="| $__bat"
      aliases[PATH]+="| $__bat"
     aliases[fpath]+="| $__bat"
     aliases[FPATH]+="| $__bat"
  aliases[commands]+="| $__bat"
fi
