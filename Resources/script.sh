#/usr/bin/env bash
echo This takes all .txt files, prints the filename, and prints the last five lines!
for filename in *.txt
do
    echo "This file is: "$filename
    tail -5 $filename
done
