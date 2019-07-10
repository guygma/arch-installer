#!/bin/bash

rm -rf archlive
cp -r archiso/configs/releng ./archlive
cp -r pacman.d archlive/airootfs/etc/pacman.d
cp pacman-airootfs.conf archlive/airootfs/etc/pacman.conf
cp pkglist-airootfs archlive/packages.x86_64
cp pacman-build.conf archlive/pacman.conf

cat <<HERE >> archlive/airootfs/root/customize_airootfs.sh

pacman-key --init
pacman-key --populate archlinux

# -- Make aurutils package and create repo
useradd -rm -b /var/lib -s /bin/nologin abe
chown -R abe:abe /var/lib/abe
mkdir -p /var/cache/AUR/pkg
chown -R abe:abe /var/cache/AUR
cd /var/lib/abe
sudo -u abe gpg --recv-keys DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A
sudo -u abe wget https://aur.archlinux.org/cgit/aur.git/snapshot/aurutils.tar.gz
sudo -u abe tar xzf aurutils.tar.gz
cd aurutils
sudo -u abe BUILDDIR=. PKGDEST=/var/cache/AUR/pkg makepkg -src
sudo -u abe repo-add aur.db.tar /var/cache/AUR/pkg
cd ..
rm -rf aurutils

# -- Now make the local repo for pacman
mkdir -p /var/cache/PACREP/pkg
cat install/pkglist | pacman --noconfirm --cachedir /var/cache/PACREP/pkg -Syw - 
repo-add pacrep.db.tar /var/cache/PACREP/pkg
HERE

sudo rm -rf work
sudo archlive/build.sh -v -o . -w work
