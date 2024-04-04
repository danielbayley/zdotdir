# https://code.visualstudio.com/docs/editor/command-line
alias vsc{ode,}=code {,vs}codium=code
ext() code --$1-extension ${@:2}

# https://code.visualstudio.com/api/working-with-extensions/publishing-extension#vsce
alias vcse='npx @vscode/vsce'
alias ovsx='npx ovsx'

# https://code.visualstudio.com/docs/editor/command-line#_core-cli-options
alias edit='${=${${VISUAL:-$EDITOR}:#code*}:-${VISUAL:-$EDITOR} --goto}'
