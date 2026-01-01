#!/bin/bash
#Script Auto Reboot Vps
#wget https://github.com/${GitUser}/
GitUser="KhaiVpn767"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
# PROVIDED
creditt=$(cat /root/provided)
# BANNER COLOUR
banner_colour=$(cat /etc/banner)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR ON TOP
text=$(cat /etc/text)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TOTAL ACC CREATE VMESS WS
total1=$(grep -c -E "^### " "/usr/local/etc/xray/config.json")
# TOTAL ACC CREATE  VLESS WS
total2=$(grep -c -E "^### " "/usr/local/etc/xray/vless.json")
# TOTAL ACC CREATE  XRAY VLESS XTLS
total3=$(grep -c -E "^### " "/usr/local/etc/xray/xtls.json")
MYIP=$(wget -qO- ifconfig.me/ip);
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /usr/local/etc/xray/domain)
else
domain=$IP
fi
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " CREATE VLESS ACCOUNT           "
  echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

  read -rp "User: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
  echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
  echo -e " CREATE VLESS ACCOUNT           "
  echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "\033[1;93m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
  fi
done
#JanganLupaMakanYa
read -p "Uuid (Manual): " uuid
read -p "Expired (days): " masaaktif
#read -p "Bug (Host): " bug
#read -p "Limit User (IP): " iplimit
#read -p "Limit User (GB): " Quota
#JanganLupaMakanYa
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
harini=`date -d "0 days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vless.json
sed -i '/#none$/a\### '"$user $exp $harini $uuid"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/vnone.json
#JanganLupaMakanYa
mv /usr/local/etc/xray/$user-VLESS-WS.yaml /home/vps/public_html/$user-VLESS-WS.yaml
vlesslink1="vless://${uuid}@${sts}${domain}:$tls?type=ws&encryption=none&security=tls&host=${sts}${domain}&path=$patch&allowInsecure=1&sni=$sni#VLESS-TLS-${user}"
vlesslink2="vless://${uuid}@${sts}${domain}:$none?type=ws&encryption=none&security=none&host=$sni&path=$patch#VLESS-NTLS-${user}"
#JanganLupaMakanYa
if [ ! -e /etc/vless ]; then
  mkdir -p /etc/vless
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/kyt/limit/vless/ip
echo -e "$iplimit" > /etc/kyt/limit/vless/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vless/${user}
fi
DATADB=$(cat /etc/vless/.vless.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vless/.vless.db
fi
echo "### ${user} ${exp} ${uuid} ${Quota} ${iplimit}" >>/etc/vless/.vless.db
clear
cat >/var/www/html/vless-$user.txt <<-END

---------------------
Format Vless WS TLS
---------------------
- name: Vless-$user-WS TLS
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}

---------------------
Format Vless WS Non TLS
---------------------
- name: Vless-$user-WS (CDN) Non TLS
  server: ${domain}
  port: 80
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vless
    headers:
      Host: ${domain}
  udp: true

---------------------
Format Vless gRPC (SNI)
---------------------
- name: Vless-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vless
  uuid: ${uuid}
  cipher: auto
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: grpc
  grpc-opts:
  grpc-mode: gun
    grpc-service-name: vless-grpc

---------------------
Link Akun Vless 
---------------------
Link TLS      : 
${vlesslink1}
---------------------
Link none TLS : 
${vlesslink2}
---------------------


END

systemctl restart xray@vless
systemctl restart xray@vnone
clear
echo -e ""
echo -e "${z}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " CREATE VLESS ACCOUNT           "
echo -e "${z}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Remarks       : ${user}"
echo -e "Host          : ${domain}"
#echo -e "Host XrayDns  : ${NS}"
#echo -e "Public Key    : ${PUB}"
echo -e "Limit Ip      : ${iplimit} Login"
echo -e "Limit Quota : ${Quota} GB"
echo -e "Port TLS      : 443"
echo -e "Port gRPC     : 443"
echo -e "Port None TLS : 80"
#echo -e "Port XrayDns  : 443,5300,53,80"
echo -e "User ID       : ${uuid}"
echo -e "Encryption    : none"
echo -e "Path          : /vless"
echo -e "${z}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Link TLS    :"
echo -e "${vlesslink1}"
echo -e "${z}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Link NTLS   :"
echo -e "${vlesslink2}"
echo -e "${z}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Link Yaml : http://$MYIP:81/$user-VLESS-WS.yaml"
echo -e "${z}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "\e[$line══════════════════════\e[m"
echo -e "Name      : ${user}"
echo -e "Created   : $harini"
echo -e "Expired   : $exp"
echo -e "SerVer    : $creditt"
echo -e "User ID   : ${uuid}"
echo -e "\e[$line══════════════════════\e[m"
echo -e "${z}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "        Script By khaiVPN             "
echo -e "${z}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu xray"
xraay