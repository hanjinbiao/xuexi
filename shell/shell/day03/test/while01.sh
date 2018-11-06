#!/bin/bash

i=1

while [ $i -le 100 ]

do

	echo -n "$i "

	let i+=2
done

echo
