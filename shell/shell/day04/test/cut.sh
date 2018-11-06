#!/bin/bash
x='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
for i in {1..8}
do
	num=$[RANDOM%62]
	passwd=$passwd${x:num:1}
done
echo $passwd
