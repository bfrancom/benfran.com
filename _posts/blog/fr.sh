#!/bin/bash
input="/tmp/realImages.txt"
while IFS= read -r line
do
  bob=$(basename $line)
  find . -type f -exec sed -i '' -e "s,$line,/images/old/$bob,g" {} \;
done < "$input"
#while read line
#find . -type f -exec sed -e "s/$line/2010/g" {} \;;done < /tmp/realImages.txt
