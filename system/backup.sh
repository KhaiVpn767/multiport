#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
IP=$(curl -sS ipv4.icanhazip.com)
domain=$(cat /etc/xray/domain)
date=$(date +"%Y-%m-%d")
clear
email=$(cat /root/email)
if [[ "$email" = "" ]]; then
echo "Masukkan Email Untuk Menerima Backup"
read -rp "Email : " -e email
cat <<EOF>>/root/email
$email
EOF
fi
clear
echo "Mohon Menunggu , Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir /root/backup
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp /etc/crontab backup/
cp /etc/vmess/.vmess.db backup/
cp /etc/ssh/.ssh.db backup/
cp /etc/vless/.vless.db backup/
cp /etc/trojan/.trojan.db backup/
cp /etc/bot/.bot.db backup/
cp -r /etc/kyt/limit backup/
cp -r /etc/limit backup/qt/
cp -r /etc/vmess backup/
cp -r /etc/trojan backup/
cp -r /etc/vless backup/
cp -r /etc/slowdns backup/
cp -r /var/lib/kyt/ backup/kyt 
cp -r /etc/xray backup/xray
cp -r /var/www/html/ backup/html
cd /root
zip -r $IP.zip backup > /dev/null 2>&1
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
curl -F chat_id="$CHATID" -F document=@"$IP.zip" -F caption="◇━━━━━━━━━━━━━━◇
   ⚠️BACKUP NOTIF⚠️
     Detail Backup VPS
◇━━━━━━━━━━━━━━◇
IP VPS  : ${IP} 
DOMAIN  : ${domain}
Tanggal : $date
◇━━━━━━━━━━━━━━◇
Link Backup   : $link
◇━━━━━━━━━━━━━━◇
Silahkan copy Link dan restore di VPS baru
" https://api.telegram.org/bot$KEY/sendDocument &> /dev/null
echo ""
rm -r /root/$IP.zip
clear
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
"
echo "Silahkan copy Link dan restore di VPS baru"
echo ""

