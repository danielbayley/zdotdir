alias nowrap='tput rmam'
alias   wrap='tput smam'

# https://github.com/sharkdp/bat#syntax-highlighting
if (($+commands[bat])) then
  alias bathelp='bat --plain --language help'
  alias -g -- --help='--help | bathelp'
  alias -g -- -h='-h | bathelp'
fi

help() {
  setopt local_options pipe_fail
  { $@ --help || man $@ -h } 2> /dev/null || man $@
}

dash() { pgrep -q Dash && open -a Dash dash://$1:${@:2} }

man()  { dash man  $@ || command man  $@ }
tldr() { dash tldr $@ || command tldr $@ }
