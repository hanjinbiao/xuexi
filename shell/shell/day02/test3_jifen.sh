#! /bin/bash

read -p "请输入您的积分："  lv_num

if [ "$lv_num" -ge 90 ];then
	echo "神功绝士"
elif [ "$lv_num" -ge 80 ];then
	
