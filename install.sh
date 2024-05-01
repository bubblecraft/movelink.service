#!/bin/sh

if [ -z "$SOURCES" ]; then
    echo "Error: specify SOURCES variable"
    exit 1
fi

if [ -z "$TARGET" ]; then
    echo "Error: specify TARGET variable"
    exit 1
fi


echo sources="$SOURCES" > /etc/movelink.service.conf
echo target="$TARGET" >> /etc/movelink.service.conf

wget -O /usr/local/sbin/movelink https://raw.githubusercontent.com/bubblecraft/movelink.service/main/src/bin/movelink
chmod +x /usr/local/sbin/movelink