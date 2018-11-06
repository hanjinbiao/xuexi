#!/bin/bash
read -p "请输入您需要判断的：" num

case $num in

[a-Z]*)

	echo "$num 是字符";;

[0-9]*)
	
	echo "$num 是数字";;

*)
	echo "$num 是其他"
esac
