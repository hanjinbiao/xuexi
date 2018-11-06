#! /bin/bash

if ping -c1 192.168.4.254 &> /dev/null;then

	echo "up"

else

	echo "down"

fi
