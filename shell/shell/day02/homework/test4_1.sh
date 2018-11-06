#! /bin/bash

My_dir="/etc/passwd"

[ -r $My_dir ]&&echo "当前用户对/etc/passwd 有读权限" || echo "当前用户对/etc/passwd 无读权限"
[ -w $My_dir ]&&echo "当前用户对/etc/passwd 有写权限" || echo "当前用户对/etc/passwd 无写权限"
[ -x $My_dir ]&&echo "当前用户对/etc/passwd 有执行权限" || echo "当前用户对/etc/passwd 无执行权限"
