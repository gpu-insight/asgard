#!/usr/bin/env bash

traverse() {
  local directory=$1
  local prefix=$2

  local children=("$directory"/*)
  local child_count=${#children[@]}

  for idx in "${!children[@]}"; do
    local child=${children[$idx]}

    local child_prefix="│   "
    local pointer="├── "

    if [ $idx -eq $((child_count - 1)) ]; then
      pointer="└── "
      child_prefix="    "
    fi

    echo "${prefix}${pointer}${child##*/}"

    [ -d "$child" ] &&
      traverse "$child" "${prefix}${child_prefix}"
  done
}

root="."
[ "$#" -ne 0 ] && root="$1"
echo $root

traverse $root ""

exit 0
