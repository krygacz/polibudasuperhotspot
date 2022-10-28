#!/bin/bash

IFNAME="wlan0"
CON_NAME="polibudasuperhotspot"
CON_PWD="jezyk123"
CON_BAND="bg"

cleanup(){
    cd ../
    rm -rf ./polibudasuperhotspot
    rm ./bootstrap.sh
}

# if cat /etc/os-release | grep -q 'Ubuntu'; then
#     echo "Detected distro: Ubuntu"
#     apt-get install wget unzip gcc -y

# elif cat /etc/os-release | grep -q 'openSUSE'; then
#     echo "Detected distro: OpenSUSE"
#     zypper in wget unzip gcc --non-interactive

# else
#     echo "Unknown distro, exiting"
#     cleanup
#     exit
# fi

# wget https://static.tp-link.com/2018/201803/20180306/TL-WN722N_Linux.zip
# unzip TL-WN722N_Linux.zip -d wifi-drivers
# cd wifi-drivers
# make && make install
# cd ../

systemctl mask wicked
systemctl mask wickedd
systemctl start NetworkManager

nmcli con add type wifi ifname $IFNAME con-name $CON_NAME autoconnect yes ssid $CON_NAME
nmcli con modify $CON_NAME 802-11-wireless.mode ap 802-11-wireless.band $CON_BAND ipv4.method shared
nmcli con modify $CON_NAME wifi-sec.key-mgmt wpa-psk
nmcli con modify $CON_NAME wifi-sec.psk $CON_PWD
nmcli con up $CON_NAME

cleanup