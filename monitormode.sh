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

switch_mode() {
    local interface
    interface=$(get_interface_name)
    local mode
    local monitor_iface

    clear
    echo "1) Start monitor mode"
    echo "2) Stop monitor mode"
    echo "3) Exit"
    read -p "Choose an option: " option

    case "$option" in
        1)  
            if sudo airmon-ng start "$interface"; then
                monitor_iface=$(ip link show | grep -o "${interface}mon" | head -n 1)
                if [ -n "$monitor_iface" ]; then
                    echo "Monitor mode started successfully on $monitor_iface"
                else
                    echo "Failed to start monitor mode"
                fi
            else
                echo "Operation failed"
            fi
            ;;
        2)
            monitor_iface=$(ip link show | grep -o "${interface}mon" | head -n 1)
            if [ -n "$monitor_iface" ]; then
                if sudo airmon-ng stop "$monitor_iface"; then
                    echo "Monitor mode stopped successfully on $monitor_iface"
                else
                    echo "Failed to stop monitor mode"
                fi
            else
                echo "No monitor mode interface found to stop"
            fi
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please select 1, 2, or 3."
            ;;
    esac

    read -p "Press any key to continue..."
}

switch_mode
