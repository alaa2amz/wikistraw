case "$1" in
	[0-9]*)
		case "$1" in
			00*)record="$1";redir=1
			;;
			*)record="`sed -n $1'p' last_result`";>last_page
			#echo here z;exit
				;;
		esac
		
		n="`echo "$record"|cut  -f1`"
		f="`echo "$record"|cut  -f4|sed "s/-index//;s/\.txt/.xml/;s/\.sorted$//"`"
		oi="`echo "$record"|cut  -f3`"
		#i="`echo $record|cut -d: -f4`"
		t="`echo "$record"|cut  -f2`"
		
echo  n $n __ f $f __ oi $oi __ t $t 	

		fstub="`echo $f|sed -r 's/-.*$//'`"
		
		if [  "$redir" != "1" ];then
			echo .TH wikistraw "9" "alaa-zak" `date -I` "$fstub"  >> last_page
			echo .SH $t >> last_page
		fi

		
		{ sh  wiki-straw.sh $oi "$f"; err=$? ; } >> last_page
		#echo err $err ;exit		
#echo zzzz;exit
# echo $? err 'tis for the tee whose $? made err with zero

		if [ $err -eq 4 ]
		then
			r="`grep '<redirect' last_page|sed -r 's/^.*"([^"]*)".*$/\1/'|sed 's/&#039;/\\x27/g'`"
			echo r $r;
			echo ".SH $r" >> last_page 	

			stubfile="`echo $f|sed 's/stream.*$//'`"
			echo stubfile $stubfile
			#rr="`bzgrep -H "[0-9]:$r\$" "$stubfile"*index*`"
			###rr="`grep -H -m1 "^$r	" "${stubfile}"*.sorted|sed 's/:/\t/'|awk -F'\t' 'BEGIN{OFS="\t"} {print "00",$2,$3,$1}'`"
			rr="`sh wikigrep.sh "$r"|head -n1|sed 's/^1/00/'`"
			#echo iiit
			#exit
			#echo rr "$rr";exit
			#echo rr "$rr"

			sh $0 "$rr";exit
		fi

		#sed -E -f buf.sed last_page|sed -E -f linkf.sed|sed -E -f f.sed|sed -E "s/^ *//; s/^'/\\&'/" > lp.man

#|awk -f xtag.awk|     j .*?</ref>
cat last_page|sed -E -f tblf.sed|sed -E -f f.sed|awk -f xtag.awk |sed -E 's/\}\}$|-->/&\n/g'|awk -f olist.awk|sed -E -f linkf.sed|awk -f abstro.awk ss="'''''"  pat="'''''\$" dstart='\\fB' dend='\\fR'|awk -f abstro.awk ss="'''" pat="'''\$" dstart='\\fB' dend='\\fR'|awk -f abstro.awk ss="''" pat="''\$" dstart='\\fI' dend='\\fR'|sed -E "s/^ *//;s/^'/\\\\\&'/"|sed 's/^ *|/.br\n&/g'|awk '/^\.S(H|S)/{$0=toupper($0)}{print}' > lp.man

		man -l lp.man

		;;
		
	*)
		sh wikigrep.sh "$@"	
		;;
esac

