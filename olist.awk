{
	if ($0 ~ "^# "){
	count+=1;sub("^# ",".IP "count"\n");
	}
	else if ($0 ~ "^ *=|^\.SH|^\.SS"){
		count=0
	}
print
}

