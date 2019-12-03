#!/bin/sh

RB_STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep ".rb\|.rake")

if [[ "$RB_STAGED_FILES" = "" ]]; then
  exit 0
fi

which rubocop &> /dev/null
if [[ "$?" == 1 ]]; then
  echo "Please install Rubocop"
  exit 1
fi

rubocop -a "$RB_STAGED_FILES"

exit $?
