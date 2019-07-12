#!/bin/bash

while IFS= read -r line; 
	do pacstrap -c $1 $line; 
done < $2
