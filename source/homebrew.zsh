alias -g i=install

brew() command brew shim ${@/-?(-)h?(elp)/help}
cask() brew $@ --cask
alias casks='brew list --cask'
alias formula{e}='brew list --formulae'
alias tap{,s}='brew tap' untap='brew untap'
alias zap='brew uninstall --zap'
alias reset='brew reset'
alias bundle='brew bundle'
alias service{,s}='brew services'
alias changelog='brew changelog'

alias a{lf{red,},wm}='brew alfred'

if ($HOMEBREW_DEVELOPER) then
  alias {ruby,rb,brewby}='brew ruby'
  alias {url,wherefrom}=list_url_attributes_on_file
  alias style='brew style'
  alias livecheck='brew livecheck --debug'
  alias audit='brew audit'
  alias appcast=find-appcast
  alias {,_}stanza='brew stanza'

  alias createzap='brew createzap'

  alias {list_associated_files,assoc{iated,}}='brew list_associated_files'
  alias {bundleid,bid}='brew find-bundle-id'
  alias running='brew ps'
  alias {where,which,}app='brew find-app'
fi
