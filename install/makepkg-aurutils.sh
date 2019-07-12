#!/bin/bash

cd /var/lib/abe
gpg --recv-keys DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A
curl -L https://aur.archlinux.org/cgit/aur.git/snapshot/aurutils.tar.gz | tar xz 
cd /var/lib/abe/aurutils
BUILDDIR=. PKGDEST=/var/cache/AUR/pkg makepkg -rc
cd ..
rm -rf aurutils
cd /var/cache/AUR/pkg
repo-add aur.db.tar *.pkg.tar.xz
