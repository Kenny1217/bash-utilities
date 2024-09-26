#!/bin/bash

CURRENT_DIRECTORY="( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
TEST_DIRECTORY="$CURRENT_DIRECTORY/tests"
TEST_FILES="$TEST_DIRECTORY/*.sh"

echo "Running tests in the directory $TEST_DIRECTORY"

for TEST in $TEST_FILES; do
    echo "The current test is $TEST"
    . "$TEST"
    echo "$TEST test completed"
done

echo "All tests in the test directory are complete"
