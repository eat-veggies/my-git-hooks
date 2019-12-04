#!/bin/sh

RB_STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM | grep ".rb\|.rake")

if [[ "$RB_STAGED_FILES" = "" ]]; then
  exit 0
fi

which bundle &> /dev/null
if [[ "$?" == 1 ]]; then
  echo "No bundler, therefore no rubocop"
  exit 1
fi

bundle exec rubocop "$RB_STAGED_FILES"

exit $?
