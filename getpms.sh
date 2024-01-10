#!/bin/bash

echo
echo "IMPORTANT: Current working directory must have RW permission otherwise pms file can't be created"
echo

read -p "Pcap file name: " file
echo
#file=capture3_jan5.pcap
if [ ! -f "$file" ];then
	echo $file not found!
	exit 0
fi

echo Pcap tcpdump commad: $(tshark -r $file -Y 'frame.number==1' -T fields -e f5fileinfo.cmdline)

cmd=$(tshark -r $file -Y f5ethtrailer.tls.keylog -Tfields -e f5ethtrailer.tls.keylog)

if [ -z "$cmd" ]; then
	echo "f5ethtrailer.tls.keylog is empty, capture command missing '--f5 ssl'?"
else
	echo $cmd | sed 's/,/\n/g' > ./$file.pms
	echo Pre-master secret filename: $file.pms
	echo
	echo "Few lines of decrypted traffic (filter = tls.record.opaque_type == 23):"
	tshark -o tls.keylog_file:$file.pms -r $file -Y "tls.record.opaque_type == 23" | head -n 5
	echo
	echo \=\=\=\=\> Copy tshark command: tshark -o tls.keylog_file:$file.pms -r $file
fi