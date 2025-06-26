#! /bin/dash

for program in "$@"; do 
    program_found=0
    directories=$(echo "$PATH" | tr '.' ' ')
    for directory in $directories; do 
        f="$directory/$program"
        if test -x "$f"; then 
            ls -ld "$f"
            program_found=1
        fi
    done

    if [ $program_found -eq 0 ]; then 
        echo "$program not found"
    fi
done