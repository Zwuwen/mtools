#!/bin/sh
while true
do
	date
	#free -m | awk 'NR==2{printf "Mem(free): used:%dMB,free:%dMB (%.2f%%)\n", $3/1024,$4/1024,$3*100/$2 }'
	#top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}' 
	top -n 1 | awk -F '[ %]+' 'NR==1 {printf "Mem(top):  used:%dMB free:%dMB (%.2f%%)\n",$(2)/1024,$(4)/1024,$2*100/($4+$2)}'
	top -n 1 | awk -F '[ %]+' 'NR==2 {printf "CPU: %d%%\n",$(2)}'
	cat /proc/31329/status| awk -F '[ %]+' 'NR==16 {printf "VmHWM:%dMB\n",$2/1024}'
	echo ===========================================================================
	sleep 3

done
