#apt-get install //when update:
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock

#java:
通过终端在/usr/local目录下新建java文件夹，命令行：

sudo mkdir /usr/local/java

然后将下载到压缩包拷贝到java文件夹中，命令行：
进入jdk源码包所在目录

cp jdk-8u77-linux-x64.tar.gz /usr/local/java

然后进入java目录，命令行：

cd /usr/local/java

解压压缩包，命令行：

sudo tar xvf jdk-8u77-linux-x64.tar.gz

然后可以把压缩包删除，命令行：

sudo rm jdk-8u77-linux-x64.tar.gz

3、设置jdk环境变量

这里采用全局设置方法，它是是所有用户的共用的环境变量

$sudo gedit ~/.bashrc
打开之后在末尾添加

export JAVA_HOME=/usr/local/java/jdk1.8.0_77 
export JRE_HOME=${JAVA_HOME}/jre 
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib 
export PATH=${JAVA_HOME}/bin:$PATH

请记住，在上述添加过程中，等号两侧不要加入空格，不然会出现“不是有效的标识符”，因为source /etc/profile 时不能识别多余到空格，会理解为是路径一部分。
然后保存。

4、检验是否安装成功
在终端输入如下命令
java -version
看看是否安装成功

#android sdk:
export PATH=${PATH}:~/adt-bundle-linux/sdk/tools
export PATH=${PATH}:~/adt-bundle-linux/sdk/platform-tools

#nodejs:
sudo apt-get update  
sudo apt-get install -y python-software-properties software-properties-common  
sudo add-apt-repository ppa:chris-lea/node.js  
sudo apt-get update  
sudo apt-get install nodejs

#update node:
sudo npm install -g n
sudo n stable

#npm:
sudo apt-get install npm
npm config set prefix /usr
sudo npm install npm -g

#inoic:
sudo npm install -g cordova ionic

#mysql:
sudo apt-get install mysql-server

#python MySQLdb:

到官方下载MySQL #for Python

然后解压，打开README：

里面有安装过程：

  $ tar xfz MySQL-python-1.2.1.tar.gz 
  $ cd MySQL-python-1.2.1 
  $ # edit site.cfg if necessary 
  $ python setup.py build 
  $ sudo python setup.py install # or su first

 

不过在python setup.py build时报错：

ImportError: No module named setuptools

ubuntu下安装：

sudo apt-get install python-setuptools

python-setuptools ： Python Distutils Enhancements (setuptools compatibility)

 

然后再次python setup.py build，又报错：

EnvironmentError: mysql_config not found

因为mysql_config是属于MySQL开发用的文件，而使用apt-get安装的MySQL是没有这个文件的，于是在包安装器里面寻找

sudo apt-get install  libmysqld-dev

libmysqld-dev ： MySQL embedded database development files

 

再次运行python setup.py build，报错：

building ‘_mysql’ extension 
gcc -pthread -fno-strict-aliasing -DNDEBUG -g -fwrapv -O2 -Wall -Wstrict-prototypes -fPIC -Dversion_info=(1,2,3,’final’,0) -D__version__=1.2.3 -I/usr/include/mysql -I/usr/include/python2.7 -c _mysql.c -o build/temp.linux-i686-2.7/_mysql.o -DBIG_JOINS=1 -fno-strict-aliasing -DUNIV_LINUX -DUNIV_LINUX 
In file included from _mysql.c:29:0: 
pymemcompat.h:10:20: fatal error: Python.h: No such file or directory

解决方案，

sudo apt-get install python-dev

#python-dev ： header files and a static library for Python (default)

 

然后就按照README里的：

  $ python setup.py build 
  $ sudo python setup.py install

测试：

>>>import MySQLdb

没有报错即可。


#python flask-sqlalchemy:
sudo pip install flask-sqlalchemy


安装 Python 开发环境：

sudo apt-get install -y python python-dev python-pip python-virtualenv


#安装scrapy
sudo apt-get install libxml2-dev libxslt1-dev
sudo pip install lxml
sudo pip install Scrapy


#配置vpn
1.第一步需要安装PPTP，以用来提供VPN服务.
a)sudo apt-get install pptpd
b)如果有问题的话比如提示找不到之类的，apt-get update 一下应该就可以了，然后再来一次就会自动完成安装。

2.装好了之后我们需要进行配置一下以让它可以使用.
a)sudo vi /etc/pptpd.conf
b)取消掉以下 2 行的注释：
i.localip 192.168.0.1
192.168.0.1 改成VPS的外网独立IP
ii.remoteip 192.168.0.234-238,192.168.0.245
“192.168.0.234-238,192.168.0.245”改成分配给用户的IP段：
例如：10.10.10.100-200

3.然后我们需要分配账号给自己使用.
a)sudo vi /etc/ppp/chap-secrets
b)添加账户：
i.例如：test	pptpd	“123”	*
格式：用户名（tab键）协议（tab键）“密码”（tab键）*
PS：密码用引号引起,最后的*号表示允许在任意IP连接到服务

4.重启pptpd服务
a)sudo service pptpd restart
5.配置DNS
a)sudo vi /etc/ppp/pptpd-options
b)找到ms-dns，取消掉注释
c)修改为当地DNS或谷歌DNS
例如：210.22.70.225
             210.22.70.3
6.开启内核IP转发
a)sudo vi  /etc/sysctl.conf
b)取消掉 net.ipv4.ip_forward=1 这一行的注释.
c)运行：sudo sysctl -p 使之生效

7.安装iptables，开启NAT转发
a)sudo apt-get install iptables （如果没有安装iptables）
b)如已安装，sudo iptables -t nat -I POSTROUTING -j MASQUERADE 
(开启nat转发)

8.重启服务，让配置生效
a)sudo service pptpd restart


#安装crypto的module
sudo apt-get install m2crypto
sudo pip install pycrypto
