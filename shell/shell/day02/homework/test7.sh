#! /bin/bash

read -p "请输入需要查询的用户名：" name1

id name1 &> /dev/null

if [ $? -eq 0 ];then

	echo "$name1 在系统中已经存在"

else

	echo "$name1 在系统中不存在"

fi
