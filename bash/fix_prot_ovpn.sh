#!/bin/bash

# ARCH MANJARO 5.3
# fix to be applied after
# https://rawsec.ml/en/archlinux-how-to-use-protonvpn/

CFG_PATH="$1"

MATCH_1="up /etc/openvpn/update-resolv-conf"
REPLACE_1="setenv PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\nup /etc/openvpn/scripts/update-systemd-resolved"

MATCH_2="down /etc/openvpn/update-resolv-conf"
REPLACE_2="down /etc/openvpn/scripts/update-systemd-resolved\ndown-pre"

for config in $CFG_PATH/*proton*.ovpn ; do
	sed -i \
		-e "s%$MATCH_1%$REPLACE_1%" \
		-e "s:$MATCH_2:$REPLACE_2:" $config
done
