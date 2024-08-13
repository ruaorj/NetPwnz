#!/bin/bash

loading_screen() {
  echo -n "$1 "
  local spin='|/-\\'
  local i=0

  while true; do
    echo -ne "\b${spin:i%${#spin}:1}"
    sleep 0.2
    ((i++))

    if [ $i -ge 20 ]; then
      break
    fi
  done
  
  echo -ne "\b \n"
}

loading_screen

install_package() {
  local package_name=$1
  local install_command=$2

  if ! command -v "$package_name" &> /dev/null; then
    echo "$package_name is not installed. Installing..."
    if [ -x "$(command -v apt-get)" ]; then
      sudo apt-get install "$install_command"
    elif [ -x "$(command -v pacman)" ]; then
      sudo pacman -S "$install_command"
    elif [ -x "$(command -v yum)" ]; then
      sudo yum install "$install_command"
    elif [ -x "$(command -v dnf)" ]; then
      sudo dnf install "$install_command"
    elif [ -x "$(command -v zypper)" ]; then
      sudo zypper install "$install_command"
    else
      echo "Unsupported package manager. Please install $package_name manually."
    fi
  else
    echo "$package_name is already installed."
  fi
}

install_package xterm xterm
install_package macchanger macchanger
install_package aircrack-ng aircrack-ng
install_package gettext gettext
install_package airmon-ng aircrack-ng
install_package airodump-ng aircrack-ng
install_package aireplay-ng aircrack-ng
