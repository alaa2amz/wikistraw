	 mawk  'BEGIN{RS="<"} $1~"^ref"{r="t"}; {if(r=="t"&&$1!~".ref") {print NR,$0,"zzz"}}; $1~"^.ref"{r="f"}'  lp.man
	 mawk  'BEGIN{RS="<"} $1~"^ref"{r="t"}; {if(r=="t"&&$1!~".ref") {print NR,$0,"zzz"}}; $1~"^.ref"{r="f"}'  lp.man
