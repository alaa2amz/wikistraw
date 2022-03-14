	 apt-cache dumpavail |awk '/^Size/{c+=$2}END{print c}'
