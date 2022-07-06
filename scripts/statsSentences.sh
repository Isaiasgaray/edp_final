#!/bin/bash

SENTENCES=$(tr '\n' ' ' < zen.txt)

echo -e ${SENTENCES//\. /\\n} \
  | awk '{TOTAL += length()};
         NR == 1 {LONGEST = $0; SHORTEST = $0};
         length($0) > length(LONGEST) {LONGEST = $0};
         length($0) < length(SHORTEST) {SHORTEST = $0};
         END {printf "%.1f\n%s\n%s\n", TOTAL / NR, LONGEST, SHORTEST}'
