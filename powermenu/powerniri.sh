#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Power Menu
#

# Current Theme
dir="$HOME/.config/powermenu/"
theme='style-default'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
shutdown='Apagar'
reboot='Reiniciar'
lock='Bloquear'
suspend='Suspender'
logout='Salir'
yes='Si'
no='No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Encendido: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Está seguro?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$logout\n$reboot\n$lock\n$suspend\n$shutdown" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			loginctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			loginctl reboot
		elif [[ $1 == '--suspend' ]]; then
			mpc -q pause
			loginctl suspend
		elif [[ $1 == '--logout' ]]; then
			desktop=$(echo  $DESKTOP_SESSION)
			echo "Está en "$desktop
			case $desktop in
				niri)
					niri msg action quit 
					;;
				*)
					niri msg action quit 
					;;
			esac
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $shutdown)
		run_cmd --shutdown
        ;;
    $reboot)
		run_cmd --reboot
        ;;
    $lock)
		/home/luis/.config/hypr/scripts/LockScreen.sh
        ;;
    $suspend)
		run_cmd --suspend
        ;;
    $logout)
		run_cmd --logout
        ;;
esac
