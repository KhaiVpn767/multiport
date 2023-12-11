#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] sila tunggu sedang Proses"
wget https://raw.githubusercontent.com/KhaiVpn767/multiport/main/addons/dns2.sh && chmod +x dns2.sh && ./dns2.sh
echo -e " [INFO] berjaya menukar ns , Enter"
sleep 2
menu

