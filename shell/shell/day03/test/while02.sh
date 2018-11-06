#!/bin/bash

Random_num=$[RANDOM%100]
i=1
while :

do
	read -p "猜下100以内的数字:" guess_num
	echo
	
	if [ $guess_num -gt $Random_num ];then
		echo "大了"
	elif [ $guess_num -lt $Random_num ];then

		echo "小了"
	else
		echo "答对了"
		echo "使用了$i次"
		exit	
	fi
	let i++
done
