#!/bin/bash

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

ListenAP(){
    echo "Enter the target's bssid:"
    read bssid
    echo "Enter the target's channel:"
    read channel
    echo "Enter the handshake file name:"
    read path


    interface=$(get_interface_name)

#        xterm -bg black -fg white -title "Deauth Monitor" -e bash -c "stty erase ^H; bash ./deauth.sh; exec bash" &

    if sudo airodump-ng --bssid "$bssid" --channel "$channel" --write "$path" "$interface"; then
        echo "Operation completed successfully"
        read -p "Press any key to continue..."
    else
        echo "Operation failed"
        read -p "Press any key to continue..."
    fi
}

ListenAP
