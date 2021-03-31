#!/bin/sh

echo "Removing all snap packages, snap cache, snap and putting snap on hold.\n"

snps=$(snap list | sed 's/ .*//' | tail -n +2)

for i in ${snps}
do
	sudo snap remove --purge $i
done

sudo rm -rf /var/cache/snapd/
sudo apt autoremove --purge snapd gnome-software-plugin-snap
rm -fr ~/snap
sudo apt-mark hold snapd
