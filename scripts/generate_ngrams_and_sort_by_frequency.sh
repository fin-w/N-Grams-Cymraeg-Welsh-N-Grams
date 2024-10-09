#!/bin/bash

if [[ "$#" -ne "1" ]] ; then
    echo "Pass a filename to this script to generate n-grams from it"
    exit 1
elif [[ ! -f "$1" ]] ; then
    echo "File does not exist."
    exit 1
fi

cat $1 | awk '
{
    for (i = 1 ; i < length($0) - 1; i++ ) {
        print substr($0, i, 1);
    }
}
' | sort | uniq -c | sort -nr | sed -e 's@^[ ]*\([0-9]*\)[ ]@\1,@' -e 's@\(^[0-9]*\)[,]\(.*$\)@\2,\1@' > 1-grams.csv


cat $1 | awk '
{
    print " " substr($0, 1, 1);
    for (i = 1 ; i < length($0) - 1; i++ ) {
        print substr($0, i, 2);
    }
    print substr($0, length($0) - 1, 1) " ";
}
' | sort | uniq -c | sort -nr | sed -e 's@^[ ]*\([0-9]*\)[ ]@\1,@' -e 's@\(^[0-9]*\)[,]\(.*$\)@\2,\1@' > 2-grams.csv


cat $1 | awk '
{
#    print "  " substr($0, 1, 1);
    print " " substr($0, 1, 2);
    for (i = 1 ; i < length($0) - 1; i++ ) {
        print substr($0, i, 3);
    }
    print substr($0, length($0) - 2, 2) " ";
#    print substr($0, length($0) - 1, 1) "  ";
}
' | sort | uniq -c | sort -nr | sed -e 's@^[ ]*\([0-9]*\)[ ]@\1,@' -e 's@\(^[0-9]*\)[,]\(.*$\)@\2,\1@' > 3-grams.csv


cat $1 | awk '
{
#    print "   " substr($0, 1, 1);
#    print "  " substr($0, 1, 2);
    print " " substr($0, 1, 3);
    for (i = 1 ; i < length($0) - 1; i++ ) {
        print substr($0, i, 4);
    }
    print substr($0, length($0) - 3, 3) " ";
#    print substr($0, length($0) - 2, 2) "  ";
#    print substr($0, length($0) - 1, 1) "   ";
}
' | sort | uniq -c | sort -nr | sed -e 's@^[ ]*\([0-9]*\)[ ]@\1,@' -e 's@\(^[0-9]*\)[,]\(.*$\)@\2,\1@' > 4-grams.csv
