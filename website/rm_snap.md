# rm_snap
Shell script for removing snap packages.

**rm_snap** is a simple shell script that removes all **snap packages** from your system, it also puts **snap** on **hold** which will prevent it from being automatically installed again.

## The script
### rm_snap.sh
```sh
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
```

## Using git
```sh
git clone https://github.com/LeifHenriksen/rm_snap.git
cd rm_snap
chmod +x rm_snap.sh
./rm_snap.sh
```

## Github repository
**https://github.com/LeifHenriksen/rm_snap**