#!/bin/bash
while true
do

STATE=$(acpi -a | grep "on-line" > /dev/null 2>&1 && echo "Y" || echo "N")
LEVEL=$(acpi -b | grep -P -o '[0-9]+(?=%)')
if [[ "$STATE" == "Y" ]]; then

	if  [  "$LEVEL" -gt 80 ]; then
			notify-send "  Battery Going to explod "
	fi
else 
	if  [  "$LEVEL" -lt 25 ]; then
			notify-send -u critical  "Running out of fuel :( "
	fi
fi
sleep 20
done
