#!/bin/bash

partdev(){
	parted $1 mkpart $2 ext4 $3 $4 I &> /dev/null
	mkfs.ext4 $1$2 &> /dev/null
	sleep 5
	partprobe
	[ -d "/mnt$1$2" ]||mkdir -p /mnt$1$2
	echo "$1$2 /mnt$1$2 ext4 defaults 0 0" >> /etc/fstab
}
echo -e "\033[31m"接下来需要输入两个分区的大小，注意加起来不要超过10G"\033[0m"
read -p "请输入1分区的大小(单位为G）：" num2
read -p "请输入2分区的大小（单位为G）： " num3
for num1 in $1 $2
do
	parted $num1 mklabel gpt yes &> /dev/null
	for i in {1..2}
	do
		if [ $i -eq 1 ];then
			partdev $num1 $i 0 $num2"G"
		else
			partdev $num1 $i $num2"G" $[num2+num3]"G"
		fi
	done
done
mount -a

