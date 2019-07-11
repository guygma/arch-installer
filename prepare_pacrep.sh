#!/bin/bash
# To be run as root

rm -rf archlive
cp -r archiso/configs/releng ./archlive
cp -r pacman.d archlive/airootfs/etc/pacman.d
cp pacman-airootfs.conf archlive/airootfs/etc/pacman.conf
cp pkglist-airootfs archlive/packages.x86_64
cp pacman-build.conf archlive/pacman.conf

# -- Now make the local repo for pacman
mkdir -p archlive/airootfs/var/cache/PACREP/pkg
cat pkglist-airootfs install/pkglist|sort|uniq|pacman --noconfirm --cachedir "${PWD}/archlive/airootfs/var/cache/PACREP/pkg/" -v -Syw -
#cat pkglist-airootfs install/pkglist|sort|uniq|pacman --noconfirm -Syw -
#cat pkglist-airootfs install/pkglist|sort|uniq|pacman --noconfirm -r ${PWD}/archlive/airootfs -Syw -
repo-add pacrep.db.tar ${PWD}/archlive/airootfs/var/cache/PACREP/pkg
