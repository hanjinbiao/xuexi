#! /bin/bash

num=$[RANDOM % 100]
num_c=0

while [ $num_c -le 6 ]

do
	read -p "请猜下数字是多少呢？(数字为100以内;一共有7次机会):" guess

	if [ $num -eq $guess ];then

		echo "猜对啦！"
		exit

	elif [ $guess -gt $num ];then

		echo "大了!"

	else 

		echo "小了!"

	fi

	let num_c++

	echo "您还有$[7 - num_c]机会!"

done
