#!/usr/bin/env bash
basePath="."

if [ ! -z "$1" -a "$1" != " " ]; then
	basePath="$1"
fi

for d in $basePath/*/; do
	echo "\n Processing for $d \n"
    branch=$(git -C $d symbolic-ref --short HEAD)
	
	echo "\n $d is in branch $branch \n"
    git -C $d pull origin $branch

    echo "\n Done.."
done
