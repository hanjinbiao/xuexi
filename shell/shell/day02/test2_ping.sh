#! /bin/bash

function myping ()
{
ping -c3 -W1 -i0.2 $address &> /dev/null

	if [ $? -eq 0 ];then
		echo "$address is sueccess!"
	else
		echo "$address is failed!"
	fi
}

if [ ! -z $1 ];then
	address=$1
	myping 
fi




