#!/bin/sh
# 
# https://github.com/hosac | hosac@gmx.net
# 

# Start service
if [ -e /etc/init.d/gmediarender ]
then
	/etc/init.d/gmediarender enable
	/etc/init.d/gmediarender start
	rm /etc/uci-defaults/set-gmediarender-enabled.sh
fi