r="`egrep  'redirect'|sed -r 's/^.*"([^"]*)".*$/\1/' `";echo $r ooo;if [ -n "$r" ] ;then sh  wiki-straw.sh "`egrep -h ":""$r""$" "$1"*index*`" "$1";fi
