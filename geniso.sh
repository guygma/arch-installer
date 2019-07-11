#!/bin/bash
# To be run as root

chown -R root:root archlive/airootfs/var/cache/AUR/pkg
( cd archlive ;
  sudo rm -rf work ;
  alias pacman="pacman --cachedir '${PWD}/airootfs/var/cache/PACREP/pkg ${PWD}/airootfs/var/cache/AUR/pkg'" ; 
  build.sh -v -o .)
