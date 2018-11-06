#! /bin/bash

find_num=`find / -size +100M -type f 2> /dev/null |wc -l `

if [ $find_num -lt 10 ];then
	
	echo $find_num 

else

	echo `find / -size +100M -type f ` 

fi

