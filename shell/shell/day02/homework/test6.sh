#! /bin/bash

read -p "请输入要计算的半径：" num

echo  "3.14 * $num * $num" | bc
