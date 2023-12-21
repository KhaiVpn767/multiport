Update & Upgrade First Your VPS for Debian 10 & 11
```
apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot
```

Update & Upgrade First Your VPS for Ubuntu 18.04 & 20.04
```
apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub && sleep 2 && reboot
```
INSTAL SCRIPT
```
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/KhaiVpn767/multiport/main/setup2.sh && chmod +x setup2.sh && sed -i -e 's/\r$//' setup2.sh && screen -S setup2 ./setup2.sh
```
