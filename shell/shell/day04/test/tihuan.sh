#!/bin/bash
read -p "请输入需要修改的格式：" num1
read -p "请输入需要更改后的格式：" num2
read -p "请输入文件所在的路径(绝对路径)：" num3
cd $num3
num4=0
for i in `ls *.$num1`
do
	mv $i ${i%.*}.$num2
	let num4+=1
done
echo "已经更换完毕，共计更换$num4个文件"

