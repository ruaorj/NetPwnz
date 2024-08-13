#!/bin/bash


clear
tput setaf 11

menu="
     ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀
    ⠀⠀⠀⠀⢀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣤⣀
    ⠀⢀⣤⣾⣿⣿⡿⠟⠛⠋⠉⠉⠉⠉⠉⠉⠉⠛⠛⠿⣿⣿⣿⣶⣄
    ⣴⣿⣿⡿⠋⠁⠀⠀⢀⣀⣠⣤⣤⣤⣤⣄⣀⠀⠀⠀⠉⠻⢿⣿⣿⡦
    ⠈⠛⠁⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠙⠋
    ⠀⠀⠀⠠⣾⣿⣿⠟⠋⠉⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⡷
    ⠀⠀⠀⠀⠈⠋⠀⠀⢀⣠⣴⣶⣶⣶⣶⣤⣄⠀⠀⠈⠋
    ⠀⠀⠀⠀⠀⠀⠀⠰⣿⣿⡿⠿⠛⠻⠿⣿⣿⡿⠂
    ⠀⠀⠀⠀⠀⠀⢀⠀⠈⠁⠀⢀⣀⣀⠀⠀⠙⠁⣀
    ⠀⠀⠀⠀⠀⠠⠌⠘⢄⠠⠂⠁⠀⠀⠈⠢⡀⠘⠀⢦
    ⠀⠀⠀⠀⠀⠀⠁⠉⠠⣧⢀⠠⡀⠀⢄⡴⡧⠘⠁⠈
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣾⡿⣮⡼⣿⣇⠁
    ⠀⠀⠀⠀⠀⠀⡀⠀⠀⠰⡖⣆⠋⢣⣶⡴⠠⢀⠀⡀
    ⠀⠀⠀⠀⠀⠠⢬⢍⠒⠁⠣⡛⠾⠟⣩⠇⠑⢂⠍⠴
    ⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠉⠁
-----------------------------------------------

1. Change Mac Address
2. Switch to MonitorMode
3. Scan All Access Points
4. Listen Target AP
5. Deauth Attack
6. Crack Handshake
7. Quit

-----------------------------------------------


"

while true
do
    clear
    echo -e "$menu"
    read -p "Choose an option: " choice

    case $choice in
        1)
            bash ./changemac.sh
            ;;
        2)
            bash ./monitormode.sh
            ;;
        3)
            bash ./scanap.sh
            ;;
        4)
            bash ./listenap.sh
            ;;
        5)
            bash ./deauth.sh
            ;;
        6)
            bash ./crack.sh
            ;;
        7)
            clear
            exit
            ;;
        *)
            echo "Invalid option. Please choose a valid option."
            ;;
    esac
done