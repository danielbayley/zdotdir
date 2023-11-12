# YAML/JSON
if (($+commands[yq])) then
  alias yq='yq --prettyPrint' pr{et,}ty=yq
  alias jq=yq
  #yq:
  #jq: yq
elif (($+commands[prettybat])) then
  alias pr{et,}ty=yq='prettybat --style=plain'
#else
fi

#alias json='npx json'
#alias yawn{-yaml-cli,}='npx yawn-yaml-cli' y{a,}ml=yawn
#alias pupa{,-cli}='npx pupa-cli'

# JSON <-> XML
json-plist() plutil -convert xml1 ${=1:--o -} -- ${1:--}
plist-json() plutil -convert json -e json -r ${=1:--o -} -- ${1:--}

# JSON <-> YAML
alias json{-,2}y{a,}ml='ruby -r json -r yaml -e "puts JSON.parse(ARGF.read).to_yaml(indentation: ${TABSIZE:-2}).lines.drop 1"'
# TODO if (tty && !stdin) #| bat --plain --language yaml FIXME
#npx --package yamljs json2yaml
#npx --package yamljs yaml2json
alias y{a,}ml{-,2}json='ruby -r yaml -r json -e "puts JSON.pretty_generate YAML.safe_load ARGF.read, aliases: true"' #| bat --plain --language json' FIXME

# YAML <-> XML
_plist=$HOMEBREW_LIBRARY_PATH/vendor/bundle/ruby/*/gems/plist-*/lib/plist(n[1])
alias y{a,}ml-{xml,plist}="ruby -r yaml -r $_plist -e 'puts YAML.safe_load(ARGF.read, aliases: true).to_plist'" #| bat --plain" #--language xml FIXME
#brew ruby -e "puts YAML.safe_load(ARGF.read, aliases: true).to_plist"
#brew ruby -e 'puts Plist.parse_xml(ARGF.read).to_yaml.lines.drop 1'
alias {xml,plist}-y{a,}ml="ruby -r yaml -r $_plist -e 'puts Plist.parse_xml(ARGF.read).to_yaml(indentation: \${TABSIZE:-2}).lines.drop 1'" #| bat --plain --language yaml" FIXME

bytes-gigabytes() echo $(($@ / 1024 ** 3))
alias b{yte,}-{gb,gigabyte}=bytes-gigabytes

# TODO
#indent: "  ", space: " "

#permitted_classes: [Date, Time, Symbol] #, symbolize_names: true
