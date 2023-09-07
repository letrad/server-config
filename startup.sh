#!/bin/bash

# Text color variables
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'
Bold='\033[1m'
Color_Off='\033[0m'

# IP ADDRESSES
localip=$(hostname -i | awk '{print $1}')
publicip=$(curl -s ifconfig.me)

# TTY CHECK
tty_check=false
if [ -z "$SSH_CONNECTION" ] && [ -t 0 ]; then
    if ping -c 1 gnu.org &>/dev/null; then
        internet_status="${Green}${Bold}[UP]${Color_Off}${Cyan} Internet Connection${Color_Off}"
    else
        internet_status="${Red}${Bold}[DOWN]${Color_Off}${Cyan} Internet Connection${Color_Off}"
    fi
    echo -e "$internet_status"
    echo -e "${Cyan}Connect to the server using SSH:${Color_Off}"
    echo -e "${Cyan}  - Local:${Color_Off} ${White}${Bold}ssh your_username@${localip}${Color_Off}"
    echo -e "${Cyan}  - Public:${Color_Off} ${White}${Bold}ssh your_username@${publicip}${Color_Off}"
else
    echo -e "${Cyan}${Bold}Welcome to the server${Color_Off}"
fi

