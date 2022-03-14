/(^|>) *\[\[File:/{
	s/\[\[(File\:[^\|]*)/.TS\nbox\;\nc.\n\1\n.TE\n/;
	#s/\]\] *$/\n.TE\n.sp/;
	#s/^[^\|]*/\n.TE\n.sp/;
	s/\]\] *$/\n\n/;
	s/\|/\n/g
}

