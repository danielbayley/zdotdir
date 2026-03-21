#! /bin/zsh --no-rcs
case ${1:-$#} in
  *.webloc) exec plutil -extract URL raw -expect string $1 -o -;;
  0) exit 1
esac

read URL <<< https://${1//(http*s:\/\/|www.)/}

alias curl='curl --location --silent'

if (($# < 2)) curl $URL |
  egrep -om 1 '<title.+?</title>' |
  xpath -e 'title/text()' -q | read title

plutil -create xml1 - |
plutil -insert URL -string $URL - -o ${title:-$2:r:s/-/}${${(M)2:#-}:-.webloc}
