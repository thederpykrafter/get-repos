#!/bin/bash

prev=$PWD

repos=$(find ~ -name ".git" \
	| grep -v ".local" \
	| grep -v ".cache" \
	| sed "s/\.git//g")

for repo in $repos; do
	curr_repo=$(echo $repo \
		| sed "s/\/data\/data\/com.termux\/files\/home\///" \
		| sed "s/\/home\/thederpykrafter\///")
	
	branch=$(git branch --show-current)
	
	cd $repo
	git remote update

	echo -e "\e[94mFound repo:\e[m "$curr_repo
	# do stuff here
	if [ ! $(git status --porcelain | wc -l) -eq "0" ]; then
		echo -e "\x1b[93mchanged files: \x1b[m"
		git status --porcelain
	fi

	echo -n "push/pull: "
	git rev-list HEAD...origin/main --count 2> /dev/null || git rev-list HEAD...origin/master --count
done

cd $prev
