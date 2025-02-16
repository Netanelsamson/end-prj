#!/bin/bash

is_perfect_square() {
    local n=$1
    local sqrt
    sqrt=$(echo "scale=0; sqrt($n)/1" | bc)
    local squared=$((sqrt * sqrt))

    [[ $squared -eq $n ]]
}

is_fibonacci() {
    local num=$1

    local option1=$((5 * num * num + 4))
    local option2=$((5 * num * num - 4))

    if is_perfect_square "$option1" || is_perfect_square "$option2"; then
        echo "$num is a Fibonacci number."

        local a=0
        local b=1
        local index=0

        while [[ $a -ne $num ]]; do
            local temp=$a
            a=$b
            b=$((temp + b))
            index=$((index + 1))
        done

        echo "$num is at index $index in the Fibonacci sequence."
    else
        echo "$num is not a Fibonacci number."
    fi
}

user_input=$1

# בדיקה שהקלט הוא מספר חיובי שלם
if [[ "$user_input" =~ ^[0-9]+$ ]]; then
    is_fibonacci "$user_input"
else
    echo "Invalid input. Please enter a positive integer."
fi
