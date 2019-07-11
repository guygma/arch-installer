#!/bin/bash

cd /var/lib/abe
gpg --recv-keys DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A
curl -L https://aur.archlinux.org/cgit/aur.git/snapshot/aurutils.tar.gz | tar xz 
cd /var/lib/abe/aurutils
BUILDDIR=. PKGDEST=/var/cache/AUR/pkg makepkg -rc
rm -rf aurutils
repo-add /var/cache/AUR/pkg/aur.db.tar
