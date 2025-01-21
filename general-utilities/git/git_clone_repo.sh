#!/bin/bash

if ! command -v git &> /dev/null; then
    echo "Error: git is required but is not installed. Please install git to continue"
    exit 1
fi

if [[ $# -ne 2 ]]; then
    echo "Wrong number of arguments"
    exit 1
fi

GIT_REPO="$1"
GIT_BRANCH="$2"
GIT_CLONE_TRIES=0
GIT_CLONE_MAX_TRIES=3
LOCAL_DIRECTORY="$3"

echo "Changing directory to $LOCAL_DIRECTORY"

cd "$LOCAL_DIRECTORY"

echo "Attempting to clone branch $GIT_BRANCH from $GIT_REPO"

while [ $GIT_CLONE_TRIES -lt $GIT_CLONE_MAX_TRIES ]; d0
    GIT_CLONE_TRIES=$((GIT_CLONE_TRIES + 1))
    echo "Attempt $GIT_CLONE_TRIES of $GIT_CLONE_MAX_TRIES"
    if git clone --recurse-submodules -b "$GIT_BRANCH" "$GIT_REPO"; then
        echo "Git clone successful"
        break
    else
        echo "Git clone failed"
    fi
done

if [ $GIT_CLONE_TRIES -eq $GIT_CLONE_MAX_TRIES ]; then
    echo "Max attempts reached. Exiting..."
fi