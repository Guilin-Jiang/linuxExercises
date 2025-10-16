#!/bin/bash
# school.sh - compute average TotalAssessedValue for MADISON SCHOOLS district

FILE="Property_Tax_Roll.csv"

grep "MADISON SCHOOLS" "$FILE" | cut -d, -f7 | \
{
  sum=0
  n=0
  while read val; do
    if [[ "$val" =~ ^[0-9]+$ ]]; then
      sum=$((sum + val))
      n=$((n + 1))
    fi
  done
  echo "Average TotalAssessedValue for MADISON SCHOOLS: $((sum / n))"
}
