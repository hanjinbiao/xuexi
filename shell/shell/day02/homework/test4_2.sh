#! /bin/bash

My_dir="/etc/passwd"

if [ -r $My_dir ];then
	echo "当前用户对/etc/passwd 有读权限"
else
	echo "当前用户对/etc/passwd 无读权限"
fi
if [ -w $My_dir ];then
	echo "当前用户对/etc/passwd 有写权限"
else
	echo "当前用户对/etc/passwd 无写权限"
fi

if [ -x $My_dir ];then
	echo "当前用户对/etc/passwd 有执行权限"
else
	echo "当前用户对/etc/passwd 无执行权限"
fi
