#!/bin/bash

CURRENT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
TEST_DIRECTORY="$CURRENT_DIRECTORY/tests"

if [ ! -d "$TEST_DIRECTORY" ]; then
    echo Test directory does not exist.
    exit 1
fi

for TEST in "$TEST_DIRECTORY/"*.sh; do
    if [ -f "$TEST" ]; then
        echo "Running: $TEST"
        . $TEST
    fi
done