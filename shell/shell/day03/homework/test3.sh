#!/bin/bash

for i in `seq 2000`
do
	[ $[i%2] -eq 0 ]&&echo $i || echo -e "\033[31mwarn\033[0m" &
done
wait

