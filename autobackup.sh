#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="KhaiVpn767"
# Color Validation
Yellow='\e[0;33m'
green='\e[0;32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\e[0m'
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# BANNER
banner=$(cat /usr/bin/bannerku)
ascii=$(cat /usr/bin/test)
clear
# Valid Script
VALIDITY() {
    today=$(date -d "0 days" +"%Y-%m-%d")
    Exp1=$(curl https://raw.githubusercontent.com/KhaiVpn767/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
        echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
        echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m"
        echo -e "\e[31mPlease renew your ipvps first\e[0m"
        exit 0
    fi
}
IZIN=$(curl https://raw.githubusercontent.com/KhaiVpn767/allow/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
    echo -e "\e[32mPermission Accepted...\e[0m"
    VALIDITY
else
    echo -e "\e[31mPermission Denied!\e[0m"
    echo -e "\e[31mPlease buy script first\e[0m"
    exit 0
fi
echo -e "\e[32mloading...\e[0m"
clear
IP=$(wget -qO- icanhazip.com)
dateToday=$(date +"%Y-%m-%d")
Name=$(curl https://raw.githubusercontent.com/KhaiVpn767/allow/main/ipvps.conf | grep $MYIP | awk '{print $2}')

setup_bot() {
    switch=$(grep -i "switch" /root/.bckupbot | awk '{print $2}')
    echo "Pergi ke @BotFather dan type /newbot untuk membuat bot baru"
    echo "Pergi ke @MissRose_bot dan type /id untuk mendapatkan ID telegram"
    echo ""
    read -p "Bot Token : " getToken
    read -p "Admin ID  : " adminID
    echo "$getToken" >/root/.bckupbot
    echo "$adminID" >>/root/.bckupbot
    echo "switch $switch" >>/root/.bckupbot
    read -n 1 -s -r -p "Press any key to back on Bot menu"
    botbckpBot_menu
}

botBackup() {
    bottoken=$(sed -n '1p' /root/.bckupbot | awk '{print $1}')
    adminid=$(sed -n '2p' /root/.bckupbot | awk '{print $1}')
    echo -e "[ ${green}INFO${NC} ] • Create password for database"
    read -t 10 -p "Enter password : " InputPass
    if [[ -z $InputPass ]]; then
        InputPass="khaivpnking"
    fi
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

    echo -e "[ ${green}INFO${NC} ] • Sending Via Bot... "
    curl -Ss --request POST \
        --url "https://api.telegram.org/bot${bottoken}/sendDocument" \
        --header 'Content-Type: multipart/form-data' \
        --form "chat_id=${adminid}" \
        --form "caption=Here Your Backup Today: ${dateToday}" \
        --form "document=@/root/${IP}.zip" >/root/t1

    fileId=$(grep -o '"file_id":"[^"]*' /root/t1 | grep -o '[^"]*$')
    curl -Ss --request GET \
        --url "https://api.telegram.org/bot${bottoken}/getfile?file_id=${fileId}" >/root/t1

    filePath=$(grep -o '"file_path":"[^"]'* /root/t1 | grep -o '[^"]*$')
    msg="File ID: <code>${fileId}</code>\n\nFile Path : <code>${filePath}</code>"
    msg=$(echo -e "$msg")
    curl -Ss --request GET \
        --url "https://api.telegram.org/bot${bottoken}/sendMessage" \
        --get \
        --data-urlencode "chat_id=${adminid}" \
        --data-urlencode "text=$msg" \
        --data-urlencode "parse_mode=html" &>/dev/null

    echo -e "[ ${green}INFO${NC} ] • Completed... "

    rm -rf /root/backup
    rm -r /root/$IP.zip
    rm -f /root/t1
    read -n 1 -s -r -p "Press any key to back on menu"
    botbckpBot_menu
}

restoreBot() {
    bottoken=$(sed -n '1p' /root/.bckupbot | awk '{print $1}')
    read -p "File ID   : " fileId
    read -p "File PATH : " filePath
    curl -Ss --request GET \
        --url "https://api.telegram.org/file/bot${bottoken}/${filePath}?file_id=${fileId}" >backup.zip

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
    cp -r trojan-go /etc/ &>/dev/null
    cp -r shadowsocksr /usr/local/ &>/dev/null
    cp -r public_html /home/vps/ &>/dev/null
    rm -rf /root/backup
    rm -f backup.zip
    echo -e "[ ${green}INFO${NC} ] • Done Restore... "
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
}

restoreLink() {
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
}

autoBackup() {
    switch=$(grep -i "switch" /root/.bckupbot | awk '{print $2}')
    if [ "${switch}" == "on" ]; then
        sed -i 's/switch on/switch off/g' /root/.bckupbot
        sed -i "/autobackup/d" /etc/crontab
        service cron restart >/dev/null 2>&1
        service cron reload >/dev/null 2>&1
        echo "Turn Off"
    else
        sed -i 's/switch off/switch on/g' /root/.bckupbot
        echo "5 0 * * * root autobackup" >>/etc/crontab
        service cron restart >/dev/null 2>&1
        service cron reload >/dev/null 2>&1
        echo "Turn On"
    fi
    sleep 1
    read -n 1 -s -r -p "Press any key to back on Bot menu"
    botbckpBot_menu
}

botbckpBot_menu() {
    switch=$(grep -i "switch" /root/.bckupbot | awk '{print $2}')
    clear
    if [ "${switch}" == "on" ]; then
        sts="\033[0;32m[On]\033[0m"
    else
        sts="\033[1;31m[Off]\033[0m"
    fi
    echo -e   " \e[$line══════════════════════════════════════════════════════\e[m"
    echo -e "\\E[0;44;37m               Telegram Bot (AutoBackup)              \E[0m"
    echo -e   " \e[$line══════════════════════════════════════════════════════\e[m"
    echo -e "$green VPS Data Backup By khaiVPN"
    echo -e "$green Telegram : https://t.me/khaivpn / @khaivpn"
    echo -e ""
    echo -e " $green Status AutoBackup : $sts"
    echo -e " $green [•1 ]${NC} $CYAN Setup Bot Telegram \e[0m"
    echo -e " $green [•2 ]${NC} $CYAN Auto Backup Status \e[0m"
    echo -e " $green [•3 ]${NC} $CYAN Backup VPS (Telegram Bot) \e[0m"
    echo -e " $green [•4 ]${NC} $CYAN Restore Data [URL]\e[0m"
    echo -e " $green [•5 ]${NC} $CYAN Restore Data \e[0m"
    echo -e "\033[0;34m══════════════════════════════════════════════════════\e[m"
    echo -e "\\E[0;44;37m          x)   MENU                                   \E[0m"
    echo -e "\033[0;34m══════════════════════════════════════════════════════\e[m"
    echo -e ""
    echo -ne "Select From Options [ 1-4 or x ] : "
    read botch
    case "$botch" in
    1)
        clear
        setup_bot
        ;;
    2)
        clear
        autoBackup
        ;;
    3)
        clear
        botBackup
        ;;
    4)
        clear
        restoreLink
        ;;
    5)
        clear
        restoreBot
        ;;
    x)
        menu
        ;;
    *)
        echo "Please enter an correct number"
        sleep 1
        botbckpBot_menu
        ;;
    esac
}
clear
[[ ! -f /root/.bckupbot ]] && {
    echo "Please Input Bot Details First"
    sleep 2
    clear
    read -p "Bot Token : " getToken
    read -p "Admin ID  : " adminID
    echo "$getToken" >/root/.bckupbot
    echo "$adminID" >>/root/.bckupbot
    echo "switch off" >>/root/.bckupbot
}
read -t 5 -p "Backup y/n?  " directBckp
if [ "${directBckp}" == "n" ]; then
    botbckpBot_menu
else
    botBackup
fi
