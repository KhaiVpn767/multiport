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
echo -e ""
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$back_text             \e[30m═[\e[$box SYSTEM MENU\e[30m ]═          \e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$number (•1)\e[m \e[$below Add New Subdomain\e[m"
echo -e "   \e[$number (•2)\e[m \e[$below Renew Cert Xray Core\e[m"
echo -e "   \e[$number (•3)\e[m \e[$below Panel Domain\e[m"
echo -e "   \e[$number (•4)\e[m \e[$below DNS Changer\e[m"
echo -e "   \e[$number (•5)\e[m \e[$below Backup Vps\e[m"
echo -e "   \e[$number (•6)\e[m \e[$below Restore Vps\e[m"
echo -e "   \e[$number (•7)\e[m \e[$below Install Webmin\e[m"
echo -e "   \e[$number (•8)\e[m \e[$below Setup Speed VPS\e[m"
echo -e "   \e[$number (•9)\e[m \e[$below Restart VPN\e[m"
echo -e "   \e[$number (10)\e[m \e[$below Speedtest VPS\e[m"
echo -e "   \e[$number (11)\e[m \e[$below Install BBR\e[m"
echo -e "   \e[$number (12)\e[m \e[$below ON/OF Auto Reboot\e[m"
echo -e "   \e[$number (13)\e[m \e[$below Change Password VPS\e[m"
echo -e ""
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "   \e[$back_text \e[$box x)   MENU                             \e[m"
echo -e "   \e[$line════════════════════════════════════════\e[m"
echo -e "\e[$line"
read -p "        Please Input Number  [1-15 or x] :  "  sys
echo -e ""
case $sys in
1)
add-host
;;
2)
certv2ray
;;
3)
panel-domain
;;
4)
dns
;;
5)
backup
;;
6)
restore
;;
7)
wbmn
;;
8)
limit-speed
;;
9)
restart
;;
10)
speedtest
;;
11)
bbr
;;
12)
autoreboot
;;
13)
passwd
;;
x)
menu
;;
*)
echo "Please enter an correct number"
sleep 1
system
;;
esac
