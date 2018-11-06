#!/bin/bash
backup="/root/shell/Day03/homework/backup"
[ -d $backup ]|| mkdir $backup
cd /etc
for i in `ls *.conf`
do
	[ $i == yum.conf ]&&continue
	tar -zcPf $backup/"$i-`date +"%Y%m%d"`".tar.gz $i
done

	
	
