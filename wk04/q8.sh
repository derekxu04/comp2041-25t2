#! /bin/dash

mlalias cs2041.25T2.tutors | 
sed -n '/Addresses/,/Owners/p' | 
head -n -1 | 
tail -n +2 | 
sed -E 's/^.*(z[0-9]{7}).*$/\1/' | 
grep -E 'z[0-9]{7}' | 
while read zid; do 
    acc "$zid" | 
    sed -n '/User classes/,/Misc classes/p' | 
    head -n -1 | 
    tail -n +2 | 
    grep -E '[A-Z]{4}[0-9]{4}t[1-3]_Student' | 
    sed -E 's/^.*([A-Z]{4}[0-9]{4})t[1-3]_Student.*$/\1/'
done |
sort | 
uniq -c |
sort -rn