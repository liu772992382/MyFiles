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
