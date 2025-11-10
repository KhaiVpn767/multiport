#!/bin/bash
#Autoscript-Lite By KhaiVpn767
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
clear
IP=$(wget -qO- icanhazip.com)
dateToday=$(date +"%Y-%m-%d")
Name=$(curl https://raw.githubusercontent.com/KhaiVpn767/allow/main/ipvps.conf | grep $MYIP | awk '{print $2}')
clear
echo " VPS Data Backup By KhaiVpn767 "
sleep 1
echo ""
echo -e "[ ${green}INFO${NC} ] Please Insert Password To Secure Backup Data ."
echo ""
read -rp "Enter password : " -e InputPass
clear
sleep 1

if [[ -z $InputPass ]]; then
	exit 0
fi

echo -e "[ ${green}INFO${NC} ] Processing . . . "
mkdir -p /root/backup
sleep 1
clear
echo " Please Wait VPS Data Backup In Progress . . . "

    sleep 1
    echo -e "[ ${green}INFO${NC} ] • VPS Data Backup... "
    sleep 1
    echo -e "[ ${green}INFO${NC} ] • Directory Created... "
    mkdir /root/backup &>/dev/null
    sleep 1
    echo -e "[ ${green}INFO${NC} ] • VPS Data Backup Start Now... "
    echo -e "[ ${green}INFO${NC} ] • Please Wait , Backup In Process Now... "
    sleep 1
    cp /etc/passwd backup/ &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • Backup passwd data..."
    sleep 1
    cp /etc/group backup/ &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • Backup group data..."
    sleep 1
    cp /etc/shadow backup/ &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • Backup shadow data..."
    sleep 1
    cp /etc/gshadow backup/ &>/dev/null
    echo -e "[ ${green}INFO${NC} ] • Backup gshadow data..."
    sleep 1
    cp -r /var/lib/premium-script/ backup/premium-script &>/dev/null
    cp -r /usr/local/etc/xray backup/xray &>/dev/null
    cp -r /home/vps/public_html backup/public_html &>/dev/null
    cd /root &>/dev/null
    zip -rP "$InputPass" "$IP.zip" backup >/dev/null 2>&1

cd /root
zip -rP $InputPass $IP-$date.zip backup >/dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/

url=$(rclone link dr:backup/$IP-$date.zip)
id=($(echo $url | grep '^https' | cut -d'=' -f2))
link="https://drive.google.com/u/4/uc?id=${id}&export=download"

clear
echo -e "\033[1;37mVPS Data Backup By KhaiVpn767\033[0m
\033[1;37mTelegram : https://t.me/KhaiVpn767 / @KhaiVpn767\033[0m"
echo ""
echo "Please Copy Link Below & Save In Notepad"
echo ""
echo -e "Your VPS IP ( \033[1;37m$IP\033[0m )"
echo ""
echo -e "Your VPS Data Backup Password : \033[1;37m$InputPass\033[0m"
echo ""
echo -e "\033[1;37m$link\033[0m"
echo ""
echo "If you want to restore data, please enter the link above"

rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo ""
