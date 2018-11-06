#! /bin/bash


for i in {sshd,httpd,crond,vsftpd}

do
	#All_ps=`ps aux | grep $i | grep -v grep |wc -l`
	All_ps=`pgrep -l $i | wc -l`
  	if [ $All_ps -ge 1 ];then
	
		echo "$i 已经启动"
	else
		echo "$i 未启动"

	fi

done
