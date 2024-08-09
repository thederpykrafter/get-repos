#!/bin/bash

prev=$PWD

repos=$(find ~ -name ".git" \
	| grep -v ".local" \
	| grep -v ".cache" \
	| sed "s/\.git//g")

for repo in $repos; do
	cd $repo

	curr_repo=$(echo $repo \
		| sed "s/\/data\/data\/com.termux\/files\/home\///" \
		| sed "s/\/home\/thederpykrafter\///")

	echo -e "\e[94mFound repo\e[m:"$curr_repo
	lazygit
done

cd $prev
