	 mawk  -F">" 'BEGIN{RS="<"} $1~"^ref"{r="t"}; {if(r=="t"&& $1 !~ ".ref" && $1 !~ "^ref.*\/$"){print NR,$0,"zzz"} ;if (r=="t" && $1~ "^ref.*\/$") { print NR,$1,"yyy"} }; $1~"^.ref" || $1~"^ref.*\/$"{r="f"}'  lp.man