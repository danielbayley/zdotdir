setopt prompt_subst prompt_percent

autoload promptinit add-zsh-hook
promptinit

if [ -d $HOMEBREW_CELLAR/$ZSH_PROMPT_THEME-prompt ]
then prompt $ZSH_PROMPT_THEME
else unset P{S,ROMPT}{1..4} RP{S,ROMPT}{1,2} SPROMPT
fi

: ${PROMPT:=$PS1}
if ([[ $PROMPT[-1] =~ [^[:space:]] ]]) PROMPT+=' '

if ([[ $__CFBundleIdentifier =~ 'atom|visualstudio' ]]) unset RPROMPT
