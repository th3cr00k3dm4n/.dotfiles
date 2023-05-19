#!/bin/bash

CLEANUP="/home/$USER/cleanup"
pacman -Qtd >> "$CLEANUP"
orphan() {
if [ -s "$CLEANUP" ]; then
	clear
    echo "! Removing orphan packages"
    sleep 0.2
    sudo pacman -Rns $(echo $(cat $CLEANUP | cut -d' ' -f1))
    sleep 0.2
    clean.cache
else
    clean.cache
fi
}
clean.cache() {
    rm "$CLEANUP"
	sleep 0.5
	echo "! Cleaning cache"
	sudo pacman -Sc
	exit 0	
}
orphan
exit 1




