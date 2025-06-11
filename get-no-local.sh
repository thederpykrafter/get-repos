#!/usr/bin/bash

function findRepo() {
  find ~ -name "$1" | grep -Ev "(.local|.cache)"
}

function getAllRepos() {
  findRepo ".git" | sed "s/\.git//g ; s/\/home\/thederpykrafter/~/g"
}

function getRemoteRepos() {
  gh repo list -L 200 | sed 's/\t.*//g ; s/thederpykrafter\///g'
}
# comm -23 <(getRemoteRepos | sort) <(getAllRepos | sort)

for repo in `getRemoteRepos`; do
  if findRepo $repo &> /dev/null; then
    # echo "Found: $repo"
    echo -n
  else
    echo "Not Found: $repo"
  fi
done
