#! /bin/bash
stty -echo
read -p "请输入密码：" pass1
echo -e "\n"
read -p "请再次输入您的密码: " pass2
echo -e "\n"
stty echo

if [ $pass1 == $pass2 ];then
	echo OK
else
	echo Error
fi
