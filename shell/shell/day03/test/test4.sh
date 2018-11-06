#!/bin/bash
x=8
for i in {1..8}
do
	for x in `seq $x`
	do	
		echo -n '* '
		let x=x-1
	done
	echo
done
