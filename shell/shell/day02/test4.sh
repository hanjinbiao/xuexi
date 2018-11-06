#! /bin/bash

read -p "请输入三个值:" n1 n2 n3

if [ $n1 -ge $n2 ];then
	if [ $n1 -ge $n3 ];then

		echo $n1
	else
		echo $n3
	fi
else
	if [ $n2 -ge $n3 ];then
		echo $n2
	else
		echo $n3
	fi
fi

