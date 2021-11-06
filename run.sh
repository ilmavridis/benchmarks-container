#!/bin/bash

BENCHS=(
    "linpack.sh"
    "stream.sh"
    "fio.sh"
)

GREPS=(
    "grep -A 11 Array"
    "grep -A 4 -e element\. -e Function"
    "grep -A 1 groupid="
)

LEN=${#BENCHS[@]}

for (( i=0; i<$LEN; i++ )); do
    echo ""
    echo "*************************-----| "${BENCHS[$i]%.*}" |-----*************************"
    ./benchs_sh_files/${BENCHS[i]} | ${GREPS[i]}
    echo ""
done