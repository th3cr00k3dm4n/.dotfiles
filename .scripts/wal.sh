#!/usr/bin/env bash
IMG=$(find ~/wallpaper -type f \( -name "*.png" -o -name "*.jpg" \)  | shuf -n1) 
sleep 0.3
swaybg -i "$IMG" -m fill >/dev/null 2>&1 &  
sleep 0.3
wal -i "$IMG" >/dev/null 2>&1 && pkill waybar  && waybar >/dev/null 2>&1 & disown &&
/home/cr00k3d/.scripts/alacritty-wal.sh
pywalfox update
sleep 0.5 
exit

