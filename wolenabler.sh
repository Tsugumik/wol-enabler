#!/bin/bash
interfaces=()
for iface in $(ifconfig | cut -d ' ' -f1| tr ':' '\n' | awk NF)
do
        if [ "$iface" != "lo" ]
        then
                interfaces+=("$iface")
        fi
done
for iface in "${interfaces[@]}"
do
       sudo /sbin/ethtool -s $iface wol g
done
