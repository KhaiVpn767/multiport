#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="KhaiVpn767"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
# PROVIDED
creditt=$(cat /root/provided)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
clear
IP=$(wget -qO- icanhazip.com);
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn3="$(cat ~/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2|sed 's/ //g')"
ovpn4="$(cat ~/log-install.txt | grep -w "OpenVPN SSL" | cut -d: -f2|sed 's/ //g')"
ohpssh="$(cat ~/log-install.txt | grep -w "OHP SSH" | cut -d: -f2|sed 's/ //g')"
ohpdrop="$(cat ~/log-install.txt | grep -w "OHP Dropbear" | cut -d: -f2|sed 's/ //g')"
wsdropbear="$(cat ~/log-install.txt | grep -w "Websocket SSH(HTTP)" | cut -d: -f2|sed 's/ //g')"
wsstunnel="$(cat ~/log-install.txt | grep -w "Websocket SSL(HTTPS)" | cut -d: -f2|sed 's/ //g')"
wsovpn="$(cat ~/log-install.txt | grep -w "Websocket OpenVPN" | cut -d: -f2|sed 's/ //g')"
nsdomain1=$(cat /root/nsdomain)
pubkey1=$(cat /etc/slowdns/server.pub)

sleep 1
Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Check Acces...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Create Acc: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
harini=`date -d "0 days" +"%Y-%m-%d"`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
exp1=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Informasi Trial SSH & OpenVPN"
echo -e "\e[33m═════════════════════════════════\033[0m"
echo -e "Username        : $Login"
echo -e "Password        : $Pass"
echo -e "Created         : $harini"
echo -e "Expired         : $exp1"
echo -e "\e[33m═════════════════════════════════\033[0m"
echo -e "Domain          : $domain"
echo -e "Name Server(NS) : $nsdomain1"
echo -e "\e[33m═════════════════════════════════\033[0m"
echo -e "Pubkey          : $pubkey1"
echo -e "\e[33m═════════════════════════════════\033[0m"
echo -e "IP/Host         : $MYIP"
echo -e "OpenSSH         : 22"
echo -e "Dropbear        : 143, 109"
echo -e "SSL/TLS         :$ssl"
echo -e "SlowDNS         : 22,80,443,53,5300"
echo -e "SSH-UDP         : 1-65535"
echo -e "WS SSH(HTTP)    : $wsdropbear"
echo -e "WS SSL(HTTPS)   : $wsstunnel"
echo -e "WS OpenVPN(HTTP): $wsovpn"
echo -e "OHP Dropbear    : $ohpdrop"
echo -e "OHP OpenSSH     : $ohpssh"
echo -e "OHP OpenVPN     : $ovpn3"
echo -e "Port Squid      :$sqd"
echo -e "Badvpn(UDPGW)   : 7100-7300"
echo -e "\e[33m═════════════════════════════════\033[0m"
echo -e "CONFIG OPENVPN"
echo -e "--------------"
echo -e "OpenVPN TCP : $ovpn http://$MYIP:81/client-tcp-$ovpn.ovpn"
echo -e "OpenVPN UDP : $ovpn2 http://$MYIP:81/client-udp-$ovpn2.ovpn"
echo -e "OpenVPN SSL : $ovpn4 http://$MYIP:81/client-tcp-ssl.ovpn"
echo -e "OpenVPN OHP : $ovpn3 http://$MYIP:81/client-tcp-ohp1194.ovpn"
echo -e "\e[33m═════════════════════════════════\033[0m"
echo -e "PAYLOAD WEBSOCKET 1 : GET / HTTP/1.1[crlf]Host: bug.com.$domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "\e[33m═════════════════════════════════\033[0m"
echo -e "PAYLOAD WEBSOCKET 2 : GET wss://bug.com/ HTTP/1.1[crlf]Host: bug.com.$domain[crlf]Upgrade: websocket[crlf]Connection: Keep-Alive[crlf][crlf]"
echo -e ""
echo -e "Script By $creditt"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
