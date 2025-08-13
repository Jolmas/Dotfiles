#!/bin/bash

labDir="/home/luis/.config/labwc"
waybarDir="/home/luis/.config/waybar"

items="Configure Labwc\nConfigure Waybar\nConfigure Autostart"
cmd=$(echo -e $items | walker --dmenu -H)

if [[ "$cmd" == "Configure Labwc" ]]; then
	foot micro "$labDir/rc.xml"
elif [[ "$cmd" == "Configure Waybar" ]]; then
	foot micro "$waybarDir/config-default"
elif [[ "$cmd" == "Configure Autostart" ]]; then
	foot micro "$labDir/autostart"
fi
