#! /bin/bash

for i in {1..5}

do

	[ $i -eq 3 ] && $1

	echo $i

done

echo hah
