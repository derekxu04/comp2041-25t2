#! /bin/dash

mlalias cs2041.25T2.tutors | 
sed -n '/Addresses/,/Owners/p' | 
head -n -1 | 
tail -n +2 | 
sed -E 's/^.*(z[0-9]{7}).*$/\1/' | 
grep -E 'z[0-9]{7}'