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

Color_Off='\033[0m'

# IP ADDRESSES
localip=$(hostname -i | awk '{print $1}')
publicip=$(curl -s ifconfig.me)

# TTY CHECK
tty_check=false
if [ -z "$SSH_CONNECTION" ] && [ -t 0 ]; then
    if ping -c 1 gnu.org &>/dev/null; then
        internet_status="\e[32m[UP]\e[0m Internet Connection"
    else
        internet_status="\e[31m[DOWN]\e[0m Internet Connection"
    fi
    echo -e "$internet_status"

fi

