#	 echo $i; egrep -iHm1 -e "^$*" "$i"|sed 's/:/\t/'|awk -F'\t' 'BEGIN{OFS="	"} {print NR,$2,$3,$1}'|tee last_result|awk -F'\t' '{print "\033[33m"$1"\033[m",$2,"\033[31m"substr($3,1,10)"\033[m"}';||
sqlite3 -separator '	' wsdb 'select  title,offid,file_name   from fhrst join files_tbl on fileno=id where title like "'"$*"'"'|awk -F'\t' 'BEGIN{OFS="	"} {print NR,$0}'|tee last_result||


egrep -iH -e "$*" *.sorted|sed 's/:/\t/'|awk -F'\t' 'BEGIN{OFS="	"} {print NR,$2,$3,$1}'|tee last_result|awk -F'\t' '{print "\033[33m"$1"\033[m",$2,"\033[31m"substr($3,1,10)"\033[m"}'

#required no \t title \t file offset:id  
##########bzegrep -iH -e "$*" *index*bzip|sed 's/:/\t/'|awk -F'\t' 'BEGIN{OFS="        "} {print NR,$2,$1,$3}'|tee last_result|awk -F'\t' '{print "\033[33m"$1"\033[m",$2,"\033[31m"substr($3,1,10)"\033[m"}'

#old working only for bz and old result style no:file:offset:id:title
#bzegrep -iH -e "$*" *index*|egrep -v ':[A-Z].*:'|nl -s:|tee last_result|awk -F: '{print "\033[33m"$1"\033[m",$5":",$6,"\033[31m"substr($2,1,10)"\033[m"}'

