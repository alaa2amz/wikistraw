/<redirect/d
s/<.?text[^>]*>//
s/\&amp;/\&/g
s/&gt;/>/g
s/&lt;/</g
s/&quot;/"/g
#s/([^'])('{2,5})([^']*)\2([^' ])/\1\n.BR "\3" \4\n/g
#s/([^'])('{2,5})([^']*)\2([^'])/\1\n.B "\3" \n\4/g

##^$
#s/^ *''([^'].*[^'])'' *$/.B \1/g
#s/^ *'''([^'].*[^'])''' *$/.B \1/g
#s/^ *'''''(.*)''''' *$/.B \1/g
#
####
#s/^ *''([^'].*[^'])'' (.*)/.B "\1"\n\2/g
#s/^ *'''([^'].*[^'])''' (.*)/.B "\1"\n\2/g
#s/^ *'''''(.*)''''' (.*)/.B "\1"\n\2/g
#
#
####
#s/^ *''([^'].*[^'])''([^' ])+ (.*)/.BR "\1" "\2 " \n\3/g
#s/^ *'''([^'].*[^'])'''([^' ])+ (.*)/.BR \1 "\2 " \n\3/g
#s/^ *'''''(.*)'''''([^' ])+ (.*)/.BR "\1" "\2 " \n\3/g
#
####
#s/(.*) ([^' ]*)''([^'].*[^'])'' *$/\1\n.RB "\2" "\3"/g
#s/(.*) ([^' ]*)'''([^'].*[^'])''' *$/\1\n.RB "\2" "\3"/g
#s/(.*) ([^' ]*)'''''(.*)''''' *$/\1\n.RB "\2" "\3"/g
#
####
#s/(.*) ([^' ]*)''([^'].*[^'])''([^' ])* (.*)/\1\n.RB "\2" "\3" "\4"\n\5/g
#s/(.*) ([^' ]*)'''([^'].*[^'])'''([^' ])* (.*)/\1\n.RB "\2" "\3" "\4"\n\5/g
#s/(.*) ([^' ]*)'''''(.*)'''''([^' ])* (.*)/\1\n.RB "\2" "\3" "\4"\n\5/g
#


#s/(.*)''([^'].*[^'])''(.*)/\1\n.RB "\2"\n\3/g
#s/(.*)'''([^'].*[^'])'''(.*)/\1\n.RB "\2"\n\3/g
#s/(.*)'''''(.*)'''''(.*)/\1\n.RB "\2"\n\3/g
#




#uniposition
#s/(^|[^'])''([^']*)''([^']|$)/\1\n.B \2 \n\3/g
#s/(^|[^'])'''([^']*)'''([^']|$)/\1\n.B \2 \n\3/g
#s/(^|[^'])'''''([^']*)'''''([^']|$)/\1\n.B \2 \n\3/g

s/^[ ]*==([^=]*)==[ ]*$/.SH \1/
s/^[ ]*====*([^=]*)====*[ ]*$/.SS \1/
#s/^[ ]*==([^=]*)==[ ]*$/.SH \1/

#s/\[\[[^|\]]*\|//g

#sat
#s/\[\[([^\|]*)\|([^]]*)\]\]/\2/g
#s/\]\]//g
#s/\[\[//g
#/\[\[File.*\]\]/{s/\[\[/.TS\nbox;\nc.\n/;s/\]\]$/\n.TE\n.sp/;s/\|/\n/g;s/\\&lt;br \/\&gt;/\n/g}

s/^\*([^*].*)/.IP \\(bu 3  \n\1/g
s/^\*\*(.*)/.RS 6 \n .IP \\(bu\\(bu   3 \n\1\n.RE/g

#s/^\*(.*$)/.IP \\(bu  1 \n\1/g
#s/^\*\*(.*$)/.IP \\(bu 7 \n\1/g
#s/^\** (.*)$/.IP \\(bu  5 \n\1/g
#s/([^'])''([^']*)''([^'])/\1\n.B \2 \n\3/g
#s/([^'])'''''([^']*)'''''([^'])/\1\n.B \2 \n\3/g
#s/[-,]/\\&/g
#s/^[ ]*//
#s/['\[{]{2,}([^'\]}]*)['}\]]{2,}/\n.B \n\1/
s/^:/.IP\n/
s/^#:/.IP "  Ex."\n/
s/^#\* /.IP "  Qu."\n/
s/^#\*:/.IP "      "\n/
s/\|passage=/\n.IP "      "\n/
