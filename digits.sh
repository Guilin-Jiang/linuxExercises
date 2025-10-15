#!/bin/bash

sum=0
for number in {1000..2000}; do
    if [[ $number =~ ^[01]+$ ]]; then
        sum=$((sum + number))
    fi
done

echo "The sum of numbers between 1000 and 2000 with digits only from {0,1} is: $sum"
