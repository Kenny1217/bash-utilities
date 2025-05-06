#!/bin/bash

CURRENT_DIRECTORY="( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
TEST_DIRECTORY="$CURRENT_DIRECTORY/tests"
TEST_FILES="$TEST_DIRECTORY/*.sh"

echo "Shell scripts tests running"

for TEST in $TEST_FILES; do
    . $TEST
done

echo "All scripts tests completed"