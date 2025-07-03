#! /usr/bin/dash

print_message() {
    if [ $# -eq 1 ]; then 
        echo "warning: $1"
        return 0
    elif [ $# -eq 2 ]; then 
        echo "error: $2"
        exit "$1"
    else
        echo "usage: print_message [error] msg"
        return 1
    fi
}

print_message "this is a warning"
# print_message 1 "this is an error"
print_message "this is also a warning"

if print_message "this is a warning"; then 
    echo "exit status was 0"
fi

output=$(print_message "this is a warning")

for word in $output; do 
    echo "$word"
done