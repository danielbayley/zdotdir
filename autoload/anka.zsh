if ((!$+commands[anka])) return

case $1 in
  -v|--version) command anka version;;
  -h|help) command anka --help;;
  ls) command anka list;;
  info) command anka describe ${@:2};;
  view)
    command anka start ${@:2}
    command anka $@;;
  restart) command anka reboot ${@:2};;
  rm|del) command anka delete ${@:2};;
  reg*) command anka registry ${@:2};;
  *) command anka $@
esac
