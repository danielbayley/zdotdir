setopt {extended,ksh,null}_glob

if (($+commands[exa]))
then alias ls=exa exa='exa --all --icons --group-directories-first -I .DS_Store'
else alias ls='ls -A'
fi

alias reveal='open -R'
alias ql='qlmanage -p'
alias ql-refresh='pkill -9 [Qq]uick[Ll]ook; qlmanage -r'

if (($+commands[trash])) alias rm=trash
