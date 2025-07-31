#! /bin/zsh --no-rcs
root() {
  git rev-parse --show-toplevel 2> /dev/null | read
  pushd ${REPLY:-$PWD}
}
