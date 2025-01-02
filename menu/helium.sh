#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="KhaiVpn767"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
clear
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "                 MENU helium              $NC"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;93m┌──────────────────────────────────────────┐\033[0m"
echo -e "  ${ORANGE}1.${NC} \033[0;36m INSTALL/HELIUM${NC}"
echo -e "  ${ORANGE}2.${NC} \033[0;36m Menu/helium${NC}"
echo -e "  ${ORANGE}0.${NC} \033[0;36m menu${NC}"
echo -e "\033[1;93m└──────────────────────────────────────────┘\033[0m"
echo -e ""
read -p " Select =>  "  opt
echo -e ""
case $opt in
1) clear ; rm -rf /usr/local/sbin/helium && wget -q -O /usr/local/sbin/helium https://raw.githubusercontent.com/abidarwish/helium/main/helium.sh && chmod +x /usr/local/sbin/helium && helium ; exit ;;
2) clear ; helium ; exit ;;
0) clear ; menu ; exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu-ssh ;;
esac
