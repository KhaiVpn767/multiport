#!/bin/bash
# Set-Backup Installation
# By KhaiVpn767
#-----------------------------
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")
#########################
MYIP=$(curl -sS https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/LICENSE/access | awk '{print $2}')
clear
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'

purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

cek=$(curl -sS https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/LICENSE/access | awk '{print $2}' | grep $MYIP)
Name=$(curl -sS https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/LICENSE/access | grep $MYIP | awk '{print $4}')

if [[ $cek = $MYIP ]]; then
	echo -e "${green}Permission Accepted...${NC}"
else
	echo -e "${red}Permission Denied!${NC}"
	echo ""
	echo -e "Your IP is ${red}NOT REGISTER${NC} @ ${red}EXPIRED${NC}"
	echo ""
	echo -e "Please Contact ${green}Admin${NC}"
	echo -e "Telegram : t.me/KhaiVpn767"
	exit 0
fi
clear

BURIQ() {
	curl -sS https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/LICENSE/access >/root/tmp
	data=($(cat /root/tmp | grep -E "^### " | awk '{print $4}'))
	for user in "${data[@]}"; do
		exp=($(grep -E "^### $user" "/root/tmp" | awk '{print $3}'))
		d1=($(date -d "$exp" +%s))
		d2=($(date -d "$biji" +%s))
		exp2=$(((d1 - d2) / 86400))
		if [[ "$exp2" -le "0" ]]; then
			echo $user >/etc/.$user.ini
		else
			rm -f /etc/.$user.ini >/dev/null 2>&1
		fi
	done
	rm -f /root/tmp
}

MYIP=$(curl -sS https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/LICENSE/access | awk '{print $2}')
Name=$(curl -sS https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/LICENSE/access | grep $MYIP | awk '{print $4}')
echo $Name >/usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman() {
	if [[ -f "/etc/.$Name.ini" ]]; then
		CekTwo=$(cat /etc/.$Name.ini)
		if [[ "$CekOne" = "$CekTwo" ]]; then
			res="Expired"
		fi
	else
		res="Permission Accepted..."
	fi
}

PERMISSION() {
	MYIP=$(curl -sS https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/LICENSE/access | awk '{print $2}')
	IZIN=$(curl -sS https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/LICENSE/access | awk '{print $2}' | grep $MYIP)
	if [[ "$MYIP" = "$IZIN" ]]; then
		Bloman
	else
		res="Permission Denied!"
	fi
	BURIQ
}

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

curl https://rclone.org/install.sh | bash
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/OTHERS/rclone.conf"

git clone https://github.com/MrMan21/wondershaper.git
cd wondershaper
make install
rm -rf wondershaper

cd /usr/bin
wget -O backup "https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/BACKUP/backup.sh"
wget -O restore "https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/BACKUP/restore.sh"
wget -O cleaner "https://raw.githubusercontent.com/KhaiVpn767/MultiportV3/main/BACKUP/logcleaner.sh"
chmod +x /usr/bin/backup
chmod +x /usr/bin/restore
chmod +x /usr/bin/cleaner

if [ ! -f "/etc/cron.d/cleaner" ]; then
	cat >/etc/cron.d/cleaner <<END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/2 * * * * root /usr/bin/cleaner
END
fi

service cron restart >/dev/null 2>&1
rm -f /root/set-br.sh
