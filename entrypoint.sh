#!/bin/sh
echo "Starting named..."
/usr/sbin/named -4 -p 53 -u named -c /etc/bind/named.conf -L named.log &
tail -F /var/bind/named.log
