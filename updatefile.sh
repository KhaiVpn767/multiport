#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading Update File"
sleep 2
# hapus menu
rm -rf menu
rm -rf menu-trial
rm -rf menu-vmess
rm -rf menu-vlesss
rm -rf renew-vless
rm -rf cek-vless
rm -rf add-vless2
rm -rf running
rm -rf clearcache
rm -rf menu-trgo
rm -rf menu-trojan
rm -rf menu-sshh
rm -rf menu-ssh
rm -rf menu-sshh
rm -rf usernew
rm -rf trial
rm -rf renew
rm -rf hapus
rm -rf cek
rm -rf member
rm -rf delete
rm -rf autokill
rm -rf ceklim
rm -rf autokilll
rm -rf tendang
rm -rf menu-set
rm -rf menu-domain
rm -rf add-host
rm -rf port-change
rm -rf certv2ray
rm -rf menu-webmin
rm -rf speedtest
rm -rf about
rm -rf auto-reboot
rm -rf restart
rm -rf bw
rm -rf port-ssl
rm -rf port-ovpn
rm -rf xp
rm -rf acs-set
rm -rf sshws
rm -rf status
rm -rf menu-backup
rm -rf backup
rm -rf restore
rm -rf jam
rm -rf up
rm -rf trialvless
rm -rf add-vless

# download script
cd /usr/bin
wget -O add-host "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/system/add-host.sh"
wget -O about "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/system/about.sh"
wget -O menu "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/menu.sh"
wget -O add-ssh "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/add-user/add-ssh.sh"
wget -O trial "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/add-user/trial.sh"
wget -O del-ssh "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/delete-user/del-ssh.sh"
wget -O member "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/delete-user/delete.sh"
wget -O cek-ssh "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/cek-user/cek-ssh.sh"
wget -O restart "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/system/restart.sh"
wget -O speedtest "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/system/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/system/info.sh"
wget -O ram "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/system/ram.sh"
wget -O renew-ssh "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/renew-user/renew-ssh.sh"
wget -O autokill "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/cek-user/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/tendang.sh"
wget -O clear-log "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/clear-log.sh"
wget -O change-port "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/change.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/change-port/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/change-port/port-ssl.sh"
wget -O port-wg "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/change-port/port-wg.sh"
wget -O port-squid "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/change-port/port-squid.sh"
wget -O port-websocket "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/change-port/port-websocket.sh"
wget -O wbmn "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/webmin.sh"
wget -O update "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/update/update.sh"
wget -O run-update "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/update/run-update.sh"
wget -O message-ssh "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/update/message-ssh.sh"
wget -O xp "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/xp.sh"
wget -O kernel-updt "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/kernel.sh"
wget -O user-list "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/more-option/user-list.sh"
wget -O user-lock "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/more-option/user-lock.sh"
wget -O user-unlock "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/more-option/user-unlock.sh"
wget -O user-password "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/more-option/user-password.sh"
wget -O antitorrent "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/more-option/antitorrent.sh"
wget -O cfa "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/cloud/cfa.sh"
wget -O cfd "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/cloud/cfd.sh"
wget -O cfp "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/cloud/cfp.sh"
wget -O swap "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/swapkvm.sh"
wget -O check-sc "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/system/running.sh"
wget -O ssh "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/menu/ssh.sh"
wget -O autoreboot "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/system/autoreboot.sh"
wget -O bbr "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/system/bbr.sh"
wget -O port-ohp "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/change-port/port-ohp.sh"
wget -O port-xray "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/change-port/port-xray.sh"
wget -O panel-domain "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/menu/panel-domain.sh"
wget -O system "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/menu/system.sh"
wget -O themes "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/menu/themes.sh"
wget -O dns "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/dns.sh"
wget -O xraay "https://raw.githubusercontent.com/KhaiVpn767/multiport/main/menu/xraay.sh"
chmod +x add-host
chmod +x menu
chmod +x add-ssh
chmod +x trial
chmod +x del-ssh
chmod +x member
chmod +x delete
chmod +x cek-ssh
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ceklim
chmod +x ram
chmod +x renew-ssh
chmod +x clear-log
chmod +x change-port
chmod +x restore
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-squid
chmod +x port-websocket
chmod +x wbmn
chmod +x update
chmod +x run-update
chmod +x message-ssh
chmod +x xp
chmod +x kernel-updt
chmod +x user-list
chmod +x user-lock
chmod +x user-unlock
chmod +x user-password
chmod +x antitorrent
chmod +x cfa
chmod +x cfd
chmod +x cfp
chmod +x swap
chmod +x check-sc
chmod +x ssh
chmod +x autoreboot
chmod +x bbr
chmod +x port-ohp
chmod +x port-xray
chmod +x panel-domain
chmod +x system
chmod +x themes
chmod +x dns
chmod +x xraay
echo -e " [INFO] Update Successfully"
sleep 2
echo ""
read -p "Enter Back To menu"
menu
