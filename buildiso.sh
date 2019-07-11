#!/bin/bash
# To be run as root

rm -rf archlive
cp -r archiso/configs/releng ./archlive
cp -r install archlive/airootfs/root/install
cp pkglist-airootfs archlive/packages.x86_64
cp pacman-build.conf archlive/pacman.conf
echo "systemctl enable sshd.socket" >> archlive/airootfs/root/customize_airootfs.sh

( cd archlive ; 
  source build.sh -v -o .. )
mv arch.iso arch.iso.old
mv arch*.iso arch.iso
