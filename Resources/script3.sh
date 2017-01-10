#/usr/bin/env bash

dir0="/dir/"
ARRAY=(
"val1"
"val2"
"val3"
)
echo "2nd value is "${ARRAY[1]}
for name in "${ARRAY[@]}"
do
    echo $dir0$name
done

