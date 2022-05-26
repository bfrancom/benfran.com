#!/bin/bash
n=1
for i in 20*
do
	gsed -i "3iimage: images/$((n++)).jpg" $i
done
