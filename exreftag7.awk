	 >refs;mawk  -F">" 'BEGIN{RS="<";OFS=">";ORS="<"} $1~"^ref"{r="t"}; {if(r=="t"&& $1 !~ ".ref" && $1 !~ "^ref.*\/$"){print ++c,$0,"zzz\n">>"refs";$0="["c"]"} ;if (r=="t" && $1~ "^ref.*\/$") { print  ++c,$1,"yyy\n" >>"refs";$1="["c"]"} }; $1~"^.ref" || $1~"^ref.*\/$"{r="f";$1=""}{print}'  lp.man
