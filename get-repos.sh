#!/bin/bash

repos=$(find ~ -name ".git" | grep -v ".local" | grep -v ".cache")

for repo in $repos; do
	cd $repo && cd ../
	echo -e "\e[94mRepo\e[m:"$PWD
	lazygit
done
