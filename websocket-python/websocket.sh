#!/bin/bash
clear
echo Installing Websocket-SSH Python
sleep 1
echo Sila Tunggu Sebentar...
sleep 0.5
cd
#Buat name user github dan nama folder
GitUser="KhaiVpn767"
namafolder="websocket-python"
#wget https://github.com/${GitUser}/main/${namafolder}/

#System Websocket
cd
cd /etc/systemd/system/
wget -O /etc/systemd/system/cdn-ssl.service https://raw.githubusercontent.com/${GitUser}/t-code/main/${namafolder}/cdn-ssl.service
#System Websocket-Ovpn Service
cd /etc/systemd/system/
wget -O /etc/systemd/system/cdn-ovpn.service https://raw.githubusercontent.com/${GitUser}/t-code/main/${namafolder}/cdn-ovpn.service
#System Websocket-Dropbear Service
cd /etc/systemd/system/
wget -O /etc/systemd/system/cdn-dropbear.service https://raw.githubusercontent.com/${GitUser}/t-code/main/${namafolder}/cdn-dropbear.service

#Install WS-SSL
wget -q -O /usr/local/bin/cdn-ssl https://raw.githubusercontent.com/${GitUser}/t-code/main/${namafolder}/cdn-ssl.py
chmod +x /usr/local/bin/cdn-ssl
#Install WS-OpenVPN
wget -q -O /usr/local/bin/cdn-ovpn https://raw.githubusercontent.com/${GitUser}/t-code/main/${namafolder}/cdn-ovpn.py
chmod +x /usr/local/bin/cdn-ovpn
#Install WS-Dropbear
wget -q -O /usr/local/bin/cdn-dropbear https://raw.githubusercontent.com/${GitUser}/t-code/main/${namafolder}/cdn-dropbear.py
chmod +x /usr/local/bin/cdn-dropbear

#Enable & Start & Restart ws-stunnel service
systemctl daemon-reload
systemctl enable cdn-ssl
systemctl start cdn-ssl
systemctl restart cdn-ssl

#Enable & Start & Restart ws-ovpn service
systemctl daemon-reload
systemctl enable cdn-ovpn
systemctl start cdn-ovpn
systemctl restart cdn-ovpn

#Enable & Start & Restart ws-dropbear service
systemctl daemon-reload
systemctl enable cdn-dropbear
systemctl start cdn-dropbear
systemctl restart cdn-dropbear