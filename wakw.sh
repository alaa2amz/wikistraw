awk -v ddd=$1 '$0 ~ "<id>"ddd"</id>"{record=1} record==1&&/<redirect title=/{print $0;exit 4} record==1&&/<text/{start=1} record==1&&start==1{print} record==1&&start==1&&/<\/text/{exit}';
