BEGIN{
	system(">refs")
	ORS="<";
	RS="<";
	FS=">";
	OFS=">";
	} 

	$1~"^ref"{
		r="t"
	} 
	#BUG:it would count a tag within ref as a ref.....I am tired for today
	r=="t"&& $1 !~ ".ref" && $1 !~ "^ref.*/$"{
		printf("%d->%s-->%s\n",++c,$1,$2)>>"refs";$0="";printf("[%d]",c)
		
	} 
	r=="t" && $1~ "^ref.*/$"{ 
		printf("%d->%s\n",++c,$1) >>"refs";$1="";printf("[%d]",c);
		#printf("%s",$2);next
	}
	$1~"^.ref" || $1~"^ref.*/$"||r=="t"{
		r="f";
		$1=""
		#printf("%s",$2);next

	}
		{
			print}
