rm tabindex;
rm tabtab;
for i in "$@"
do
	p=`echo $i|grep -o "p[0-9]*p[0-9]*"`
	c=$(($c+1))
	echo  $c $i >>tabtab
	echo file $c of $# >&2
	#cat "$1"|sed -E 's/^([0-9]*:[0-9]*):(.*)/\2\t\1/'|while read l;do echo  "$l\t${i##*-}";done
	cat "$1"|while read l;do echo    "$l\t$c";done >>tabindex
	#time cat "$1"|while read l;do echo    "$l\t$c"|sed -E 's/(\t[0-9]+):([0-9]+\t)/\1\t\2/';done >>tabindex

	#cat "$i"|while read l;do echo  "$l\t$i">>mm.ss; done&
done
