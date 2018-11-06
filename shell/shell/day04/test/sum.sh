#!/bin/bash

read -p "请输入整数：" num

num=${num:-1}
#sum=0
for i in `seq $num`
do
	let sum+=i
done
echo $sum
