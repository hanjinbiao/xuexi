#! /bin/bash

function match_ps ()

{
if [ $each -ge 1 ];then
	echo "$i 已启动"
else
	echo "$i 未启动"
fi
}

for i in {sshd,httpd,crond,vsftpd}

do
each=`ps aux | grep $i | grep -v grep | wc -l`

match_ps $each $i

done


