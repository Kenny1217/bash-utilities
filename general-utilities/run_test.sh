#!/bin/bash

DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd )"
TEST_DIRECTORY="$DIRECTORY/tests"

echo "Test Directory: $TEST_DIRECTORY"

if [[ ! -d "$TEST_DIRECTORY" ]]; then
    echo "Test directory does not exist"
    exit 1
fi

echo "Running tests"

for TEST in "$TEST_DIRECTORY/"*.sh; do
    if [[ -f $TEST ]]; then
        . $TEST
    fi
done

echo "All tests completed"
