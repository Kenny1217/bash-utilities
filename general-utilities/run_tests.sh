#!/bin/bash

CURRENT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd )"
TEST_DIRECTORY="$CURRENT_DIRECTORY/tests"

if [[ ! -d "$TEST_DIRECTORY" ]]; then
    echo "Test directory does not exist. Exiting..."
    exit 1
fi

echo "Running tests in $TEST_DIRECTORY"

for TEST in "$TEST_DIRECTORY/"*.sh; do
    if [[ -f $TEST ]]; then
        . $TEST
    fi
done

echo "All tests completed"
