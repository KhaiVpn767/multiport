#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="KhaiVpn767"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
bottoken=$(sed -n '1p' /root/.bckupbot | awk '{print $1}')
    read -p "File Url   : " file_url
    wget -O /root/backup.zip "$file_url"
    echo -e "[ ${green}INFO${NC} ] • Restore Data..."
    read -rp "Password File: " InputPass
    echo -e "[ ${green}INFO${NC} ] • Getting your data..."
    unzip -P $InputPass /root/backup.zip &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • Starting to restore data..."
    rm -f /root/backup.zip &>/dev/null
    sleep 1
    cd /root/backup
    echo -e "[ ${green}INFO${NC} ] • Please Wait , Restoring In Process Now... "
    sleep 1
    cp passwd /etc/ &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • Restoring passwd data..."
    sleep 1
    cp group /etc/ &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • Restoring group data..."
    sleep 1
    cp shadow /etc/ &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • Restoring shadow data..."
    sleep 1
    cp gshadow /etc/ &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • Restoring gshadow data..."
    sleep 1
    cp -r premium-script /var/lib/ &>/dev/null
    cp -r xray /usr/local/etc/ &>/dev/null
    cp -r public_html /home/vps/ &>/dev/null
    rm -rf /root/backup
    rm -f backup.zip
    echo -e "[ ${green}INFO${NC} ] • Done Restore... "
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
