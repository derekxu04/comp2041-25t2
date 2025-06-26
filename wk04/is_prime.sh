#! /bin/dash

# Tests whether the specified integer is a prime

# Check from 2 ... sqrt(n), is n divisible 
# if n divisible        -> n is not prime
# if n is not divisible -> n is prime

n=$1

if [ $n -eq 1 ]; then 
    echo "$n is not prime"
    exit 1
fi

i=2
while [ $((i * i)) -le $n ]; do 
    if [ $((n % i)) -eq 0 ]; then
        echo "$n is not prime"
        exit 1
    fi
    i=$((i + 1))
done

echo "$n is prime"
exit 0