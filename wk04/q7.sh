#! /bin/dash

acc z5218654 | 
sed -n '/User classes/,/Misc classes/p' | 
head -n -1 | 
tail -n +2 | 
grep -E '[A-Z]{4}[0-9]{4}t[1-3]_Student' | 
sed -E 's/^.*([A-Z]{4}[0-9]{4})t[1-3]_Student.*$/\1/'
