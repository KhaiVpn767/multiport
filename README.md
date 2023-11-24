# SILA INSTALL SCRIPT NI TAMPA MENGGUNA KAN VPN..MESTI KENA STABIL LINE ANDA
- JIKA ADA MASALAH SILA DM SAYA DI TELEGRAM..

                                           
<h2 align="center"> Autoscript by khaiVPN</h2>

<h2 align="center"> Supported Linux Distribution</h2>
<p align="center"><img src="https://linuxconfig.org/wp-content/uploads/2018/05/debian_vs_ubuntu.png"></p>
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=blue"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2011&message=Bullseye&color=blue"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=18.04 LTS&color=blue"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=20.04 LTS&color=blue"></p>

<p align="center"><img src="https://img.shields.io/badge/Service-OpenSSH-success.svg"> <img src="https://img.shields.io/badge/Service-Dropbear-success.svg">  <img src="https://img.shields.io/badge/Service-Websocket-success.svg"> <img src="https://img.shields.io/badge/Service-BadVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Stunnel-success.svg">  <img src="https://img.shields.io/badge/Service-OpenVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Squid3-success.svg">  <img   src="https://img.shields.io/badge/Service-Webmin-success.svg">  <img src="https://img.shields.io/badge/Service-OHP-success.svg">  <img
src="https://img.shields.io/badge/Service-Xray-success.svg">  <img src= "https://img.shields.io/badge/Service-SSR-success.svg">  <img src="https://img.shields.io/badge/Service-Trojan Go-success.svg"> <img src="https://img.shields.io/badge/Service-Trojan-success.svg"> <img src="https://img.shields.io/badge/Service-WireGuard-success.svg"> <img src="https://img.shields.io/badge/Service-Shadowsocks-success.svg">

## Commands : <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=powershell&label=Shell&message=Bash%20Script&color=lightgray">

## Update & Upgrade First Your VPS for Debian 10 & 11

  ```html
  apt update -y && apt upgrade -y && apt dist-upgrade -y && reboot
  ```

## Update & Upgrade First Your VPS for Ubuntu 18.04 & 20.04

  ```html
  apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub && reboot
  ```
 
## INSTALLATION SCRIPT

  ```html
  sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/KhaiVpn767/multiport/main/setup2.sh && chmod +x setup2.sh && ./setup2.sh

  ```

## Info :

 ## Script FREE using license key 

   ```html
  khaivpnking
  ```
 
Feedback to owner on Telegram khaiVPN<a href="https://t.me/khaivpn" target=”_blank”><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=Telegram&label=Telegram&message=Click%20Here&color=blue"></a> to fix BUG (slow respond)

# Description :

  ## Service & Port

  - OpenSSH                 : 22
  - OpenVPN                 : TCP 1194, UDP 2200, SSL 110
  - Stunnel4                : 222, 777
  - Dropbear                : 442, 109
  - OHP Dropbear            : 8585
  - OHP SSH                 : 8686
  - OHP OpenVPN             : 8787
  - Websocket SSH(HTTP)     : 2081
  - Websocket SSL(HTTPS)    : 222
  - Websocket OpenVPN       : 2084
  - Squid Proxy             : 3128, 8000
  - Badvpn                  : 7100, 7200, 7300
  - Nginx                   : 81
  - Wireguard               : 5820
  - Shadowsocks-R           : 1443-1543
  - SS-OBFS TLS             : 2443-2543
  - SS-OBFS HTTP            : 3443-3543
  - XRAY Vmess Ws Tls       : 443
  - XRAY Vless Ws Tls       : 443
  - XRAY Trojan Ws Tls      : 443
  - XRAY Vless Tcp Xtls     : 443
  - XRAY Vmess Ws None Tls  : 80
  - XRAY Vless Ws None Tls  : 8080
  - XRAY Trojan Ws None Tls : 8880
  - Trojan Go               : 8443

  ## Server Information & Other Features
   - Timezone                 : Asia/Kuala_Lumpur (GMT +8)
   - Fail2Ban                 : [ON]
   - DDOS Dflate              : [ON]
   - IPtables                 : [ON]
   - Auto-Reboot              : [ON]- 5.00AM
   - IPv6                     : [OFF]
   - Auto-Remove-Expired      : [ON]
   - Auto Delete Expired Account
   - Fully automatic script
   - VPS settings
   - Admin Control
   - Change port
   - Full Orders For Various Services

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
