#!/bin/bash
#Autoscript-Lite By KhaiVpn767
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
clear
echo ""
echo " This Feature Can Only Be Used According To VPS Data With This Autoscript"
echo " Please Insert VPS Data Backup Link To Restore The Data"
echo ""
read -rp " Password File: " -e InputPass
read -rp " Link File: " -e url
wget -O backup.zip "$url"
unzip -P $InputPass /root/backup.zip &>/dev/null
rm -f backup.zip
sleep 1
echo " Start Restore . . . "
cp /root/backup/.acme.sh /root/ &>/dev/null
echo -e "[ ${green}INFO${NC} ] Restoring passwd data..."
sleep 1
cp /root/backup/passwd /etc/ &>/dev/null
echo -e "[ ${green}INFO${NC} ] Restoring group data..."
sleep 1
cp /root/backup/group /etc/ &>/dev/null
echo -e "[ ${green}INFO${NC} ] Restoring shadow data..."
sleep 1
cp /root/backup/shadow /etc/ &>/dev/null
echo -e "[ ${green}INFO${NC} ] Restoring chap-secrets data..."
sleep 1
cp /root/backup/chap-secrets /etc/ppp/ &>/dev/null
echo -e "[ ${green}INFO${NC} ] Restoring passwd data..."
sleep 1
cp /root/backup/passwd1 /etc/ipsec.d/passwd &>/dev/null
cp -r /root/backup/premium-script /var/lib/ &>/dev/null
cp -r /root/backup/xray /usr/local/etc/ &>/dev/null

# Pemulihan fail vless.json dan trojan.json
cp /root/backup/xray/vless.json /usr/local/etc/xray/vless.json &>/dev/null
cp /root/backup/xray/trojan.json /usr/local/etc/xray/trojan.json &>/dev/null

cp -r /root/backup/public_html /home/vps/ &>/dev/null
cp /root/backup/crontab /etc/ &>/dev/null
cp -r /root/backup/cron.d /etc/ &>/dev/null
rm -rf /root/backup
rm -f backup.zip
echo ""
echo -e "[ ${green}INFO${NC} ] VPS Data Restore Complete !"
echo ""
echo -e "[ ${green}ok${NC} ] Restarting XRAY Vmess WS"
systemctl restart xray.service
sleep 0.2
echo -e "[ ${green}ok${NC} ] Restarting XRAY Vless WS"
systemctl restart xray@vless.service
sleep 0.2
echo -e "[ ${green}ok${NC} ] Restarting XRAY Trojan WS"
systemctl restart xray@trojanws.service
sleep 0.2
echo -e "[ ${green}ok${NC} ] Restarting Nginx"
/etc/init.d/nginx restart >/dev/null 2>&1
sleep 0.2
echo -e "[ ${green}ok${NC} ] Restarting Cron "
/etc/init.d/cron restart >/dev/null 2>&1
sleep 0.2
echo -e "[ ${green}ok${NC} ] Restarting SSH "
/etc/init.d/ssh restart >/dev/null 2>&1
sleep 0.2
echo -e "[ ${green}ok${NC} ] Restarting Dropbear "
/etc/init.d/dropbear restart >/dev/null 2>&1
sleep 0.2
echo -e "[ ${green}ok${NC} ] Restarting stunnel4 "
/etc/init.d/stunnel4 restart >/dev/null 2>&1
sleep 0.2
clear
echo ""
