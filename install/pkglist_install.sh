#!/bin/bash

while IFS= read -r line; 
	do pacman --noconfirm -S $line; 
done < $1
