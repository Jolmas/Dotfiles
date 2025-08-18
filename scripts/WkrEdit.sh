#!/bin/bash

labDir="$HOME/.config/labwc"
waybarDir="$HOME/.config/waybar"

items="Configure Labwc\nConfigure Waybar\nConfigure Autostart"
cmd=$(echo -e $items | walker --dmenu)

if [[ "$cmd" == "Configure Labwc" ]]; then
	foot micro "$labDir/rc.xml"
elif [[ "$cmd" == "Configure Waybar" ]]; then
	foot micro "$waybarDir/config-default"
elif [[ "$cmd" == "Configure Autostart" ]]; then
	foot micro "$labDir/autostart"
fi
