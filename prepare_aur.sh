#!/bin/bash
# To be run as non-root

gpg --recv-keys DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A
wget https://aur.archlinux.org/cgit/aur.git/snapshot/aurutils.tar.gz
tar xzf aurutils.tar.gz                                           
mkdir -p archlive/airootfs/var/cache/AUR/pkg
( cd aurutils ; 
BUILDDIR=. PKGDEST=../archlive/airootfs/var/cache/AUR/pkg makepkg -src )
rm -rf aurutils
repo-add aur.db.tar archlive/airootfs/var/cache/AUR/pkg
