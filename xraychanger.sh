#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : KhaiVpn767
# (C) Copyright 2024
# =========================================
R='\e[1;31m'
P='\e[0;35m'
B='\033[0;36m'
G='\033[0;32m'
NC='\e[0m'
N='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
purple='\e[0;35m'
orange='\e[0;33m'
NC='\e[0m'
# Xray-Core Version
xrays_path=$(which xray)
xrays_version=$("$xrays_path" --version 2>&1)
current_version=$(echo "$xrays_version" | awk '/Xray/{print $2}')
# / / Ambil Xray Core Version Terbaru
latest_version="$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
# / / Installation Xray Core
xraycore_link="https://github.com/XTLS/Xray-core/releases/download/v$latest_version/Xray-linux-64.zip"
clear
echo -e "\e[31m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;47;30m               XRAY-CORE CHANGER            \E[0m"
echo -e "\e[31m╘════════════════════════════════════════════╛\033[0m
\033[1;37mXray-core Changer By KhaiVpn767\033[0m
\033[1;37mTelegram : https://t.me/khaivpn \033[0m"
echo -e 
echo -e "
\033[1;36m\033[0m Current version : ${orange}v${current_version} ${NC}
 
 [\033[1;31m• 1\033[0m]  Xray-core v1.5.4
 [\033[1;31m• 2\033[0m]  Xray-core v1.6.1
 [\033[1;31m• 3\033[0m]  Xray-core v1.7.2
 [\033[1;31m• 4\033[0m]  Xray-core v1.7.5
 [\033[1;31m• 5\033[0m]  Xray-core v1.8.4
 [\033[1;31m• 6\033[0m]  Xray-core v${latest_version} ${green} << Latest ${NC}
 
 [\033[1;31m•77\033[0m]  Xray-core MOD v1.6.5   
 [\033[1;31m•88\033[0m]  Xray-core MOD v1.7.2-1

 [\033[1;31m•99\033[0m]  Check Xray-core version
 [\033[1;31m• 0\033[0m]  Back To Main Menu

 Notes: 
❇️ Please restart / reboot server after change Xray-core.
❇️ If you using old XTLS, downgrade Xray-core v1.7.5 or lower.
❇️ Xray-core MOD support custom path / multipath. Only use it if your scripts support."
echo ""
echo -e "\033[1;37mPress [ Ctrl+C ] • To-Exit-Script\033[0m"
echo ""
read -p "Select From Options [ 1 - 99 ] :  " xcore
echo -e ""
case $xcore in
1)
clear
mv $xrays_path $xrays_path.bakk && wget -q -O $xrays_path "https://github.com/KhaiVpn767/Xcore-custompath/releases/download/Xray-linux-64-v1.5.4/Xray-linux-64-v1.5.4" && chmod 755 $xrays_path && xray version
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
xraychanger
;;
2)
clear
mv $xrays_path $xrays_path.bakk && wget -q -O /usr/local/bin/xray "https://github.com/KhaiVpn767/Xcore-custompath/releases/download/Xray-linux-64-v1.6.1/Xray-linux-64-v1.6.1" && chmod 755 $xrays_path && xray version
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
xraychanger
;;
3)
clear
mv $xrays_path $xrays_path.bakk && wget -q -O $xrays_path "https://github.com/KhaiVpn767/Xcore-custompath/releases/download/Xray-linux-64-v1.7.2/Xray-linux-64-v1.7.2" && chmod 755 /usr/local/bin/xray && xray version
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
xraychanger
;;
4)
clear
mv $xrays_path $xrays_path.bakk && wget -q -O $xrays_path "https://github.com/KhaiVpn767/Xcore-custompath/releases/download/Xray-linux-64-v1.7.5/Xray-linux-64-v1.7.5" && chmod 755 $xrays_path && xray version
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
xraychanger
;;
5)
clear
mv $xrays_path $xrays_path.bakk && wget -q -O $xrays_path "https://github.com/KhaiVpn767/Xcore-custompath/releases/download/Xray-linux-64-v1.8.4/Xray-linux-64-v1.8.4" && chmod 755 $xrays_path && xray version
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
xraychanger
;;
6)
clear
mv $xrays_path $xrays_path.bakk && curl -L https://github.com/XTLS/Xray-core/releases/download/v$latest_version/Xray-linux-64.zip > Xray-linux-64.zip && unzip *.zip && mv xray /usr/local/bin && chmod +x $xrays_path && rm *.zip *.dat LICENSE README.md && xray version
#mv $xrays_path $xrays_path.bakk && curl -L https://github.com/XTLS/Xray-core/releases/download/v${latest_version}/xray-linux-64.zip > xray-linux-64.zip && unzip *.zip && mv xray /usr/local/bin && chmod +x $xrays_path && rm *.zip *.dat LICENSE README.md && xray version
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
xraychanger
;;
77)
clear
mv $xrays_path $xrays_path.bakk && wget -q -O $xrays_path "https://github.com/KhaiVpn767/Xcore-custompath/releases/download/Xray-linux-64-v1.6.5.1/Xray-linux-64-v1.6.5.1" && chmod 755 $xrays_path && xray version
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
xraychanger
;;
88)
clear
mv $xrays_path $xrays_path.bakk && wget -q -O $xrays_path "https://github.com/KhaiVpn767/Xcore-custompath/releases/download/Xray-linux-64-v1.7.2-1/Xray-linux-64-v1.7.2-1" && chmod 755 $xrays_path && xray version
read -p "$( echo -e "Press ${orange}[ ${NC}${green}Enter${NC} ${CYAN}]${NC} Back to menu . . .") "
xraychanger
;;
99)
clear
xray version
echo -e "[ ${green}INFO${NC} ] Back to menu in 5 sec . . . "
##echo -e "\033[0;32mBack to menu in 5 sec\033[0;32m"
sleep 5
xraychanger
;;
0)
clear
menu
;;
*)
clear
echo -e "[ ${red}INFO${NC} ] Please enter an correct number . . . "
#echo -e "\e[1;31m Please enter an correct number\e[1;31m"
sleep 3
xraychanger
;;
esac
