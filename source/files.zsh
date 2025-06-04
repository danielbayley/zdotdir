# https://zsh-manual.netlify.app/options#1623-expansion-and-globbing
setopt ksh_glob glob_star_short

alias mk{dir{{-,}p,},}='mkdir -p'
autoload mkdir

alias sbx=sandbox {mk,}t{e,}mp{,dir}=sandbox
autoload sandbox

alias ln{-,}s=symlink
symlink() { mkdir -p $2:h && ln -s $@ }

if (($+commands[npx])) then
  alias cp='npx cpy-cli'
  alias mv='npx move-file-cli'
else
  alias cp='cp -R'
fi

autoload zmv
alias mv=zmv {rnm,rename}=mv

if (($+commands[trash])) alias rm=trash

alias {exe,{+,}x}='chmod +x'
alias mode='stat -f %A'

# https://github.com/lsd-rs/lsd#lsd-lsdeluxe
if (($+commands[lsd])) then
  alias    ls='lsd --literal'
  alias  ls-1='ls  --oneline' l{s{-,},}1=ls-1
  alias    ll='ls  --long --icon never' l{s{-,}l,}=ll
  alias lsize='ll  --sizesort --blocks permission,size,date,git,name' l{s{-,},}z=lsize
  alias  tree='ls  --tree'
else
  alias ls='ls -A'
fi

alias reveal='open -R'
alias ql='qlmanage -p'
alias ql-refresh='pkill -9 [Qq]uick[Ll]ook; qlmanage -r'

if (($+commands[fd]))  alias find=fd
if (($+commands[bat])) alias cat='bat --paging never --style numbers'
