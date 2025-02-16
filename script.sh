

is_perfect_square() {
    n=$1
    sqrt=$(echo "sqrt($n)" | bc)
    squared=$((sqrt * sqrt))

    [ $squared -eq $n ]
}

# Function to check if a number is a Fibonacci number and find its index
is_fibonacci() {
    num=$1

   
    option1=$((5 * num * num + 4))
    option2=$((5 * num * num - 4))

    if (is_perfect_square $option1) || (is_perfect_square $option2); then
        echo "$num is a Fibonacci number."

     
        a=0
        b=1
        index=0

      
        while [ $a -ne $num ]; do
            temp=$a
            a=$b
            b=$((temp + b))
            index=$((index + 1))
        done

        echo "$num is at index $index in the Fibonacci."
    else
        echo "$num is not a Fibonacci number."
    fi
}


user_input=$1


if [[ $user_input =~ ^[0-9]+$ ]]; then
  
    is_fibonacci $user_input
else
    echo "Invalid input. Please enter a positive integer."
fi
