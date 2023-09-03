#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'

cpath="/etc/openvpn/server/server-tcp-1194.conf"
dns=($(cat /etc/resolvconf/resolv.conf.d/head | awk '{print $2}'))
echo -e "══════════════════════════\e[m"
echo -e " Change DNS Script By KhaiVPN ⚡"
echo -e "══════════════════════════\e[m"
echo -e "DEFAULT DNS SERVER SEKARANG : 8.8.8.8"
echo -e "DNS SERVER KINI= $dns"
echo -e ""
echo -e "${green}MASUKKAN DNS BARU ATAU TEKAN CTL C UTK KELUAR MENU${NC}"
echo -e ""
read -p "NEW DNS SERVER: " dns2
if [ -z $dns2 ]; then
	echo "Please Input Port"
	mdns
fi
# Masukkan DNS kedalam RESOLVE
echo -e ""
echo "nameserver $dns2" >/etc/resolv.conf
echo "nameserver $dns2" >/etc/resolvconf/resolv.conf.d/head

# Masukkan DNS kedalam Conf
sed -i "/dhcp-option DNS/d" $cpath
sed -i "/redirect-gateway def1 bypass-dhcp/d" $cpath

cat >>$cpath <<END
push "redirect-gateway def1 bypass-dhcp"
push "dhcp-option DNS $dns2"
END

systemctl stop resolvconf.service
systemctl enable resolvconf.service
systemctl start resolvconf.service
clear
sleep 2
echo -e "============================================="
echo -e " ${green} PERTUKARAN DNS SERVER SIAP ✅${NC}"
echo -e "============================================="
echo ""
echo -ne "[ ${yell}WARNING${NC} ] Do you want to reboot now ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ]; then
	menu
else
	reboot
fi
