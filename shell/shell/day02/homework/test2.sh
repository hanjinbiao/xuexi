#! /bin/bash

num=`ps aux | wc -l`

if [ $num -gt 100 ];then

	echo "$num" | mail -s "Waring进程数超标" root

fi
