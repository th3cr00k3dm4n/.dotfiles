#!/bin/env bash

MAKOCTL="/usr/bin/makoctl"
MAKOCONFIG="$HOME/.config/mako/config"
#MAKOCONFIG="/tmp/config"
COLORS="$HOME/.cache/wal/colors"

COLOR0=`head -1 $COLORS`
COLOR1=`head -2 $COLORS | tail -1`
COLOR2=`head -3 $COLORS | tail -1`
COLOR3=`head -4 $COLORS | tail -1`
COLOR4=`head -5 $COLORS | tail -1`
COLOR5=`head -6 $COLORS | tail -1`
COLOR6=`head -7 $COLORS | tail -1`

cat << EOF > $MAKOCONFIG

max-history=100
sort=-time

on-button-left=dismiss
on-button-middle=none
on-button-right=dismiss-all
on-touch=dismiss
on-notify=exec mpv /usr/share/sounds/freedesktop/stereo/message.oga

font=JetBrains Mono 10
width=300
height=100
margin=20
padding=15
border-size=2
border-radius=6
icons=1
max-icon-size=48
icon-location=left
markup=1
actions=1
history=1
text-alignment=left
default-timeout=5000
ignore-timeout=0
max-visible=5
layer=overlay
anchor=bottom-right

background-color=$COLOR0
text-color=$COLOR1

[urgency=low]
border-color=$COLOR1
background-color=$COLOR0
text-color=$COLOR1

[urgency=normal]
border-color=$COLOR1
background-color=$COLOR0
text-color=$COLOR1
default-timeout=10000
ignore-timeout=1

[urgency=high]
font=Sauce Code Pro 16
border-color=$COLOR1
background-color=$COLOR0
text-color=$COLOR1
default-timeout=0
ignore-timeout=1
EOF
$MAKOCTL  reload

