alias p=print
alias list='print -l'

alias {FPATH,fpath}='list $fpath'
alias {PATH,path}='list $path'

alias {where,whence,type}=which
alias cmd=command {commands,cmds}='list $commands | sort'
