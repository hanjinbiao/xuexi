#!/bin/bash
sum=0
num=1
while [ $num -le 100 ]
do
	let num+=1
	let sum+=num
done
echo $sum
