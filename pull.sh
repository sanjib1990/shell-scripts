#!/usr/bin/env bash
BASE_PATH="."

if [ ! -z "$1" -a "$1" != " " ]; then
    BASE_PATH="$1"
fi

processGit()
{
    git -C $2 checkout $1
    echo "\n $2 is in BRANCH $1"
    git -C $2 fetch --all --prune
    git -C $2 pull origin $1
}

for d in ${BASE_PATH}/*/; do
    echo "\n Processing for ${d}"
    BRANCH=$(git -C ${d} symbolic-ref --short HEAD)
    echo "\n Checking out Master branch"
    processGit master ${d}
    echo "\n Checking out Current branch"
    processGit ${BRANCH} ${d}
    echo "\n Done.."
    echo "\n###########################################"
done
