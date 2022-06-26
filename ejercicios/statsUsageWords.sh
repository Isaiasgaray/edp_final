#!/bin/bash

[ $# -ne 1 ] && exit 1

PALABRAS_FILTRADAS=$(
while read -r line; do
  for word in $line; do
    [ ${#word} -lt 4 ] && continue
    echo "$word"
  done
done < "${1}"
)

echo "$PALABRAS_FILTRADAS" \
  | sort \
  | uniq -c \
  | sort -nr \
  | head -10 \
  | tr -s ' ' \
  | cut -c 2-
