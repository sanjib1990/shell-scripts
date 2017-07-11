#!/usr/bin/env bash
BASE_PATH="."

if [ ! -z "$1" -a "$1" != " " ]; then
	BASE_PATH="$1"
fi

for d in ${BASE_PATH}/*/; do
	echo "\n Processing for ${d} \n"
    BRANCH=$(git -C ${d} symbolic-ref --short HEAD)
	
	echo "\n ${d} is in BRANCH ${BRANCH} \n"
    git -C ${d} pull origin ${BRANCH}

    echo "\n Done.."
done
