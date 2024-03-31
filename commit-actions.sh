#!/bin/bash

function do_commit () {
  message="$1"

  complexity=3
  i=1

  prev_commit_hash=$(git log --format="%H" -1)
  commit_hash=$(git log --format="%H" -1)
  hash_prefix=${commit_hash:0:$complexity}

  while [ $? -ne 0 ] || [ $commit_hash = $prev_commit_hash ] || [ $(( 10#$hash_prefix )) -ne 0 ]; do
    echo "Attempt: $i"
    i=$((i+1))

    git commit -m "$message" -m "Lucky Number: $(date '+%N')"

    commit_hash=$(git log --format="%H" -1)
    hash_prefix=${commit_hash:0:$complexity}
    [ -n "$hash_prefix" ] && [ "$hash_prefix" -eq "$hash_prefix" ] 2>/dev/null
  done
}

function do_amend () {
  message="$1"

  complexity=3
  i=1

  prev_commit_hash=$(git log --format="%H" -1)
  commit_hash=$(git log --format="%H" -1)
  hash_prefix=${commit_hash:0:$complexity}

  [ -n "$hash_prefix" ] && [ "$hash_prefix" -eq "$hash_prefix" ] 2>/dev/null
  while [ $? -ne 0 ] || [ $commit_hash = $prev_commit_hash ] || [ $(( 10#$hash_prefix )) -ne 0 ]; do
    echo "Attempt: $i"
    i=$((i+1))
    git commit --amend -m "$message" -m "Lucky Number: $(date '+%N')"
    commit_hash=$(git log --format="%H" -1)
    hash_prefix=${commit_hash:0:$complexity}
    [ -n "$hash_prefix" ] && [ "$hash_prefix" -eq "$hash_prefix" ] 2>/dev/null
  done
}

function do_cherry_pick () {
  hash="$1"
  message="$2"

  prev_commit_hash=$(git log --format="%H" -1)
  commit_hash=$(git log --format="%H" -1)
  complexity=3
  hash_prefix="111"
  i=1

  while [ $? -ne 0 ] || [ $commit_hash = $prev_commit_hash ] || [ $(( 10#$hash_prefix )) -ne 0 ]; do
    echo "Attempt: $i"
    i=$((i+1))
    git reset --hard
    git cherry-pick "$hash" -n
    git commit -m "$message" -m "Lucky Number: $(date '+%N')"

    commit_hash=$(git log --format="%H" -1)
    hash_prefix=${commit_hash:0:$complexity}
    [ -n "$hash_prefix" ] && [ "$hash_prefix" -eq "$hash_prefix" ] 2>/dev/null
  done
}
