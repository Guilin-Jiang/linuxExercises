#!/bin/bash

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "usage: $0 <column> [file.csv]" 1>&2
  exit 1
fi


col=$1
if [[ -n "$2" ]]; then
  file=$2
else
  file=/dev/stdin
fi


cat "$file" | cut -d',' -f "$col" | tail -n +2 | {

    sum=0
    n=0

    while read x; do
	sum=$(echo "$sum + $x" | bc)
	n=$((n+1))
    done

    mean=$(echo "scale=2; $sum / $n" | bc)
    echo "$mean"
}
