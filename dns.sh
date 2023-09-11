#!/bin/bash
#DNS Changer By khaivpn
#-------------------------
P='\e[0;35m'
B='\033[0;36m'
N='\e[0m'
clear
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m                 DNS CHANGER                \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m
\033[1;37mDNS Changer By Khaivpn\033[0m
\033[1;37mTelegram : https://t.me/khaivpn / @khaivpn\033[0m

 [\033[1;36m•1 \033[0m]  Temporary DNS
 [\033[1;36m•2 \033[0m]  Permanent DNS
 [\033[1;36m•3 \033[0m]  Back To Main Menu"
echo""
echo -e "\033[1;37mPress [ Ctrl+C ] • To-Exit-Script\033[0m"
echo ""
read -p "Select From Options [ 1-3 ] :  " dns
echo -e ""
case $dns in
1)
clear
echo -e "\033[1;37mTemporary DNS - Back To Default DNS After Rebooting VPS\033[0m"
echo ""
read -p "Please Insert DNS : " dns1
if [ -z $dns1 ]; then
echo ""
echo "Please Insert DNS !"
sleep 1
clear
dns
fi
rm /etc/resolv.conf
touch /etc/resolv.conf
echo "nameserver $dns1" >> /etc/resolv.conf
systemctl restart resolvconf.service
echo ""
echo -e "\e[032;1mDNS $dns1 sucessfully insert in VPS\e[0m"
echo ""
cat /etc/resolv.conf
sleep 1
clear
menu
;;
2)
clear
echo ""
read -p "Please Insert DNS : " dns2
if [ -z $dns2 ]; then
echo ""
echo "Please Insert DNS !"
sleep 1
clear
dns
fi
rm /etc/resolv.conf
rm /etc/resolvconf/resolv.conf.d/head
touch /etc/resolv.conf
touch /etc/resolvconf/resolv.conf.d/head
echo "nameserver $dns2" >> /etc/resolv.conf
echo "nameserver $dns2" >> /etc/resolvconf/resolv.conf.d/head
systemctl restart resolvconf.service
echo ""
echo -e "\e[032;1mDNS $dns2 sucessfully insert in VPS\e[0m"
echo ""
cat /etc/resolvconf/resolv.conf.d/head
sleep 1
clear
menu
;;
3)
clear
menu
;;
*)
echo "Please enter an correct number"
clear
dns
;;
esac
