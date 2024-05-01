# movelink.service
systemd script to move and link paths on boot


install

curl -sfL https://raw.githubusercontent.com/bubblecraft/movelink.service/main/install.sh | sudo TARGET=/media/data SOURCES="/var/lib/longhorn" sh -