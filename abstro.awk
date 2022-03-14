BEGIN{FS=""}
{
	for(i=1;i<=NF;i++){
		b=b$i
		if(b ~ pat){
			c+=1
		sub(ss,c%2==1?dstart:dend,b)	
	}
	}
		print b
		b=""
		#sffar el 3addad ya mo7taram
		c=0;
}
