# YAML/JSON
if (($+commands[yq])) then
  alias yq='yq --prettyPrint' pr{et,}ty=yq
  alias jq=yq
elif (($+commands[prettybat])) then
  alias pr{et,}ty='prettybat --style=plain'
fi

# JSON <-> XML
json-plist() plutil -convert xml1 ${=1:--o -} -- ${1:--}
plist-json() plutil -convert json -e json -r ${=1:--o -} -- ${1:--}

# JSON <-> YAML
alias json{-,2}y{a,}ml='ruby -r json -r yaml -e "puts JSON.parse(ARGF.read).to_yaml(indentation: ${TABSIZE:-2}).lines.drop 1"'
alias y{a,}ml{-,2}json='ruby -r yaml -r json -e "puts JSON.pretty_generate YAML.safe_load ARGF.read, aliases: true"'

# YAML <-> XML
_plist=$HOMEBREW_LIBRARY_PATH/vendor/bundle/ruby/*/gems/plist-*/lib/plist(n[1])
alias y{a,}ml-{xml,plist}="ruby -r yaml -r $_plist -e 'puts YAML.safe_load(ARGF.read, aliases: true).to_plist'"
alias {xml,plist}-y{a,}ml="ruby -r yaml -r $_plist -e 'puts Plist.parse_xml(ARGF.read).to_yaml(indentation: \${TABSIZE:-2}).lines.drop 1'"

bytes-gigabytes() echo $(($@ / 1024 ** 3))
alias b{yte,}-{gb,gigabyte}=bytes-gigabytes
