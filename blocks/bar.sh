#!/usr/bin/bash

SEP="|"
DIR="~/scripts/blocks/"

ActiveWindow(){
	len=$(echo -n "$(xdotool getwindowfocus getwindowname)" | wc -m)
	max_len=70
	if [ "$len" -gt "$max_len" ];then
		echo -n "$(xdotool getwindowfocus getwindowname | cut -c 1-$max_len)..."
	else
		echo -n "$(xdotool getwindowfocus getwindowname)"
	fi
}

while true; do
    echo -e "%{l}  $(desktop) $SEP $(memory) $SEP $(cpu)" "%{c}$(ActiveWindow)" "%{r}$(battery) $SEP $(volume) $SEP $(now)  "
	sleep 1s
done
