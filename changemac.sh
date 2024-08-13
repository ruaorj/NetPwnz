#!/bin/bash

get_interface_name() {
    if ip link show | grep -q wlan0; then
        echo "wlan0"
    elif ip link show | grep -q wlo1; then
        echo "wlo1"
    else
    
        iface=$(ip link show | grep -o 'wl[a-z0-9]*' | head -n 1)
        if [ -z "$iface" ]; then
            echo "No wireless interface found."
            exit 1
        else
            echo "$iface"
        fi
    fi
}

SwitchMac() {
    interface=$(get_interface_name)

    if macchanger --random "$interface"; then
        echo "Operation completed successfully"
        read -p "Press any key to continue..."
    else
        echo "Operation failed"
        read -p "Press any key to continue..."
    fi
}

SwitchMac
