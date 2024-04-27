case $1 in
  *.webloc) plutil -extract URL raw -expect string $1 -o -;;

  *) read URL <<< https://${1//(http*s:\/\/|www.)/}

    if (($# < 2)) then
      curl --location $URL --silent |
      egrep -om 1 '<title.+?</title>' |
      xpath -e 'title/text()' -q | read title
    fi

    plutil -create xml1 - |
    plutil -insert URL -string $URL - -o ${title:-$2:r}.webloc
esac
