#!/bin/sh

if [ -z "$SOURCES" ]; then
    echo "Error: specify SOURCES variable"
fi

if [ -z "$TARGET" ]; then
    echo "Error: specify TARGET variable"
fi


sudo echo sources="$SOURCES" > /etc/movelink.service.conf
sudo echo target="$TARGET" >> /etc/movelink.service.conf

sudo wget -O /usr/local/sbin/movelink https://raw.githubusercontent.com/bubblecraft/movelink.service/main/src/bin/movelink
sudo chmod +x /usr/local/sbin/movelink