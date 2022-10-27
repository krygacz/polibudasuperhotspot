#!/bin/bash

IFNAME="wlan0"
CON_NAME="polibudasuperhotspot"
CON_PWD="jezyk123"

if cat /etc/os-release | grep -q 'Ubuntu'; then
    echo "Detected distro: Ubuntu"
    systemctl mask wicked
    systemctl mask wickedd
    systemctl start NetworkManager

    nmcli con add type wifi ifname $IFNAME con-name $CON_NAME autoconnect yes ssid $CON_NAME
    nmcli con modify $CON_NAME 802-11-wireless.mode ap 802-11-wireless.band bgn ipv4.method shared
    nmcli con modify $CON_NAME wifi-sec.key-mgmt wpa-psk
    nmcli con modify $CON_NAME wifi-sec.psk $CON_PWD
    nmcli con up $CON_NAME

elif cat /etc/os-release | grep -q 'openSUSE'; then
    echo "Detected distro: OpenSUSE"
    echo "\n\n\n"
    systemctl mask wicked
    systemctl mask wickedd
    systemctl start NetworkManager

    nmcli con add type wifi ifname $IFNAME con-name $CON_NAME autoconnect yes ssid $CON_NAME
    nmcli con modify $CON_NAME 802-11-wireless.mode ap 802-11-wireless.band bgn ipv4.method shared
    nmcli con modify $CON_NAME wifi-sec.key-mgmt wpa-psk
    nmcli con modify $CON_NAME wifi-sec.psk $CON_PWD
    nmcli con up $CON_NAME
else
    echo "Unknown distro, exiting"
fi