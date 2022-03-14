usage="foffset: file from offset to stdout
	foffset {file} {offset}"
if [ $# -eq 0 ] ;then echo "$usage";exit;fi
dd bs=1 skip="$2" if="$1"
