#!/bin/bash

MyPwd=`pwd`

AutoYum(){
	read -p "请输入Yum源地址:" YumUrl
	rm -rf /etc/yum.repos.d/*.repo
	echo "[development]
name=rhel7
baseurl=$YumUrl
enabled=1
gpgcheck=0" > /etc/yum.repos.d/development.repo
}
#检测是否配置yum
yum clean all &> /dev/null
YumCheck1=`yum repolist &> /dev/null`
if [ $? -ne 0 ];then
	AutoYum
fi
YumCheck2=`yum repolist | sed -n '/repolist/p'|awk -F: '{print $2}'|sed 's/,//'`
if [ $YumCheck2 -eq 0 ];then
	AutoYum
else
	echo -e "\033[32mYum源检测正常\033[0m"
fi

#自动安装nginx及升级nginx
AutoNginx(){
	tar -xf "$1"
	mypwd=`ls $1`
	mydir=`echo $mypwd |sed 's/.*\///;s/.tar.gz//'`
	cd $MyPwd/$mydir
	useradd -s /sbin/nologin nginx &> /dev/null
	./configure --prefix=/usr/local/nginx --user=nginx --group=nginx \
	--with-http_ssl_module --with-stream --with-http_stub_status_module&& make && make install > /dev/null
	rm -rf /sbin/nginx &> /dev/null
	ln -s /usr/local/nginx/sbin/nginx /sbin/nginx
}
UpgradeNginx(){
	tar -xf "$1"
	mypwd=`ls $1`
	mydir=`echo $mypwd |sed 's/.*\///;s/.tar.gz//'`
	cd $MyPwd/$mydir
	./configure --prefix=/usr/local/nginx --user=nginx --group=nginx $2 && make > /dev/null
	mv /usr/local/nginx/sbin/nginx{,.bak} &> /dev/null
	cp $MyPwd/$mydir/objs/nginx /usr/local/nginx/sbin/nginx
}
#UpgradeNginxWith(){
#	tar -xf "$1"
#	mypwd=`ls $1`
#	mydir=`echo $mypwd |sed 's/.*\///;s/.tar.gz//'`
#	cd $MyPwd/$mydir
#	./configure --prefix=/usr/local/nginx --user=nginx --group=nginx $2 && make > /dev/null
#	mv /usr/local/nginx/sbin/nginx{,.bak} &> /dev/null
#	cp $MyPwd/$mydir/objs/nginx /usr/local/nginx/sbin/nginx
#}
CheckDevel(){
	for i in gcc make pcre-devel openssl-devel
	do
		rpm -ql $i &> /dev/null 
		if [ $? -eq 0 ];then
			echo -e "\033[32m$i已安装\033[0m"
		else
			echo -e "\033[31m$i未安装\033[0m将自动为您安装$i"
			yum install $i -y > /dev/null
			echo -e "\033[32m$i已安装\033[0m"
		fi
	done
}

echo "初次安装，请输入：1 
升级版本安装，清输入：2"

read num

if [ $num -eq 1 ];then
	read -p "请输入安装包路径及包名：" PacDir
	CheckDevel
	AutoNginx $PacDir 
	echo -e "\033[32m Nginx已安装完成\033[0m"
	nginx -V
elif [ $num -eq 2 ];then
#	read -p "请输入安装包路径及包名：" PacDir
	read -p "请输入安装包路径及需要增加的插件：" PacDir With
	UpgradeNginx $PacDir $With
	echo -e "\033{32m Nginx已经升级完毕\033[0m"
	nginx -V
#elif [ $num -eq 3 ];then
#	read -p "请输入安装包路径及需要增加的插件：" PacDir With
#	UpgradeNginx $PacDir $With
#	echo -e "\033{32m Nginx已经升级完毕\033[0m"
#	nginx -V
else
	echo "输入错误！"""
	exit 99
fi

echo "程序将自动帮您开启，如果不需要请输入：n
确定则直接回车即可"

read commit

if [ "$commit" == "n" ];then
	echo '开机命令位：/root/nginx.sh start'
	exit 98
else
	$MyPwd/nginx.sh start
fi
