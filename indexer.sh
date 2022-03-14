bzcat "$1"|sed -E 's/^([0-9]*:[0-9]*):(.*)/\2\t\1/'|sort -f -t'	' -k1,1 > "$1".sorted
#bzcat "$1"|sed -E 's/^([0-9]*:[0-9]*):(.*)/\2\t\1:'"${1##*.bz2}/"|sort -f -t'	' -k1,1 > si-${1%%-pages*}.txt
