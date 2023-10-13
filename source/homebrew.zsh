alias -g  i=install
alias -g ri=reinstall
alias -g  t=test

# https://brew.sh
cask() brew $@ --cask
alias       casks='brew list --casks'
alias {mass,apps}='mas  list'
alias  formula{e}='brew list --formulae'
alias     tap{,s}='brew tap' untap='brew untap'
alias         zap='brew uninstall --zap'
alias       reset='brew reset'
alias      bundle='brew bundle'
alias service{,s}='brew services'
alias   changelog='brew changelog'

alias a{lf{red,},wm}='brew alfred'

if (($+HOMEBREW_DEVELOPER)) then
  alias       brb='brew ruby'
  alias   rubocop='brew rubocop'
  alias     style='brew style'
  alias     audit='brew audit'
  alias livecheck='brew livecheck'
  alias   appcast=find-appcast
  alias    stanza='brew stanza'
  alias createzap='brew createzap'

  alias {url,wherefrom}=list_url_attributes_on_file
  alias {list{_,-}associated{_,-}files,assoc{iated,}}='brew list_associated_files'
  alias running='brew ps'
  alias app='brew find-app' {find,where,which}{_,-}=app
fi
