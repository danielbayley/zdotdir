# https://zsh-manual.netlify.app/prompt-expansion
setopt prompt_subst prompt_percent

autoload promptinit
promptinit

# https://zsh-manual.netlify.app/user-contributions#266-prompt-themes
if [ -d $HOMEBREW_CELLAR/$ZSH_PROMPT_THEME-prompt ]
then prompt $ZSH_PROMPT_THEME
else unset P{S,ROMPT}{1..4} RP{S,ROMPT}{1,2} SPROMPT
fi

: ${PROMPT:=$PS1}
if ([[ $PROMPT[-1] =~ [^[:space:]] ]]) PROMPT+=' '
if ([ $TERM_PROGRAM = vscode ]) unset RPROMPT
