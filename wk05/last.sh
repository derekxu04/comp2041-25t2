#! /usr/bin/env dash

z0=0
z1=0
z2=0
z3=0

while read -r zid _; do 
    case "$zid" in 
        z0*) z0=$((z0 + 1)) ;;
        z1*) z1=$((z1 + 1)) ;;
        z2*) z2=$((z2 + 1)) ;;
        z3*) z3=$((z3 + 1)) ;;
        *) echo "unknown zid" ;;
    esac
done < last.log

echo "z0: $z0"
echo "z1: $z1"
echo "z2: $z2"
echo "z3: $z3"
