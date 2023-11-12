zmodload zsh/attr

size() { du -sh $@ | cut -f1 }

__appdirs=(
  /System/Library/CoreServices
  /System/Applications
  /Applications
)
__appdirs=(-onlyin\ $^__appdirs)

app-path() mdfind kind:application $=__appdirs -interpret "$=*" 2> /dev/null
app-domain() { app-path $@ -attr kMDItemCFBundleIdentifier | awk '{ print $NF }' }

alias created='getfileinfo -d'
alias v{ersion,}='mdls -name kMDItemVersion -raw'

# https://developer.mozilla.org/docs/Web/HTTP/Basics_of_HTTP/MIME_types
alias mime='file --mime-type -b'
alias bin=binary nonbin{ary,}=non-binary
    binary() { mime   ${1:-$REPLY} | grep --silent ${@:2} binary }
non-binary() { binary ${1:-$REPLY} --invert-match }

# https://developer.apple.com/documentation/uniformtypeidentifiers
alias  uti='mdls -name kMDItemContentType     -raw'
alias utis='mdls -name kMDItemContentTypeTree -raw'

# https://developer.mozilla.org/docs/Web/API/FontData/postscriptName
alias {postscript,ps,font}name='fc-scan --format %{postscriptname}'
