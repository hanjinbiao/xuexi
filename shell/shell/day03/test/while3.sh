#! /bin/bash

i=0

while :
do
	read -p "请输入整数,输入'0'结束运算：" num
	[ $num == 0 ]&&break
#	let i+=num
	i=`echo "$i+$num" |bc`
done

echo "总和为：$i"

