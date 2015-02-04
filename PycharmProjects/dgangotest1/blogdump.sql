/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.21-log : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `blog`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

LOCK TABLES `auth_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

LOCK TABLES `auth_group_permissions` WRITE;

UNLOCK TABLES;

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

LOCK TABLES `auth_permission` WRITE;

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add author',8,'add_author'),(23,'Can change author',8,'change_author'),(24,'Can delete author',8,'delete_author'),(25,'Can add blog',9,'add_blog'),(26,'Can change blog',9,'change_blog'),(27,'Can delete blog',9,'delete_blog');

UNLOCK TABLES;

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

LOCK TABLES `auth_user` WRITE;

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$12000$a1nM3sZDliGV$nSLoc90PS3eXMTpECZQ+dsA3RJT/WfV9io566n/0cSA=','2014-12-16 05:25:44',1,'root','','','122727569@qq.com',1,1,'2014-12-16 02:27:57'),(2,'pbkdf2_sha256$12000$Zjr1vBEscZjA$xC10JnLfRhkUc4qPvV6ns3Kq8Vfbd7XT9xNBM53PYn0=','2014-12-16 03:48:00',0,'bao','宝宝','冯','122727569@qq.com',0,1,'2014-12-16 03:48:00');

UNLOCK TABLES;

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

LOCK TABLES `auth_user_groups` WRITE;

UNLOCK TABLES;

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

LOCK TABLES `auth_user_user_permissions` WRITE;

insert  into `auth_user_user_permissions`(`id`,`user_id`,`permission_id`) values (1,2,25),(2,2,26),(3,2,27);

UNLOCK TABLES;

/*Table structure for table `blog_author` */

DROP TABLE IF EXISTS `blog_author`;

CREATE TABLE `blog_author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorname` varchar(20) NOT NULL,
  `email` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `blog_author` */

LOCK TABLES `blog_author` WRITE;

insert  into `blog_author`(`id`,`authorname`,`email`) values (2,'冯宝宝',''),(4,'张三','1320336185@qq.com');

UNLOCK TABLES;

/*Table structure for table `blog_blog` */

DROP TABLE IF EXISTS `blog_blog`;

CREATE TABLE `blog_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `summary` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `createdate` datetime NOT NULL,
  `classify` varchar(20) NOT NULL,
  `keyword` varchar(20) NOT NULL,
  `commentnumber` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `readnumber` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `blog_blog` */

LOCK TABLES `blog_blog` WRITE;

insert  into `blog_blog`(`id`,`title`,`summary`,`content`,`createdate`,`classify`,`keyword`,`commentnumber`,`hits`,`readnumber`) values (1,'lnmp搭建','本文简绍了linux环境下怎么搭建lnmp环境，包括详细的安装步骤。','Curl  -I  taobao.com  查看淘宝服务器信息\r\n1 源码安装mysql\r\n  Tar  zxf  mysql-5.5.12.tar.gz\r\n	Du  -sh  mysql-5.5.12\r\nCd  mysql-5.5.12\r\nYum list  mysql 查看本机上的mysql版本\r\nRpm  -qa  | grep php\r\nRpm  -qa  | grep httpd\r\nRpm –qa  |  grep  mysql  查看系统上他们的版本\r\nYum install  make cmake  gcc  gcc-c++  -y  安装编译工具安装时需要的工具\r\nCmake  -DCMAKE_INSTALL_PREFIX=/usr/local/lnmp/mysql   \\\r\n-DMYSQL_DATADIR=/usr/local/lnmp/mysql/data   \\\r\n-DMYSQL_UNIX_ADDR=/usr/local/mysql/data/mysql.scok  \\\r\n-DWITH_MYISAM_TORAGE_ENGINE=1  \\\r\n-DDEFAULT_CHARSET=utf8  \\\r\n-DDEFAULT_COLLATION=utf8_general_ci  \\\r\n-DEXTRA_CHARSETS=all\r\n 提示错误 \r\n \r\n	Yum install  -y   ncurses-devel \r\ncmake \\\r\n-DCMAKE_INSTALL_PREFIX=/usr/local/mysql \\\r\n-DMYSQL_DATADIR=/usr/local/mysql/data \\\r\n-DSYSCONFDIR=/etc \\\r\n-DWITH_MYISAM_STORAGE_ENGINE=1 \\\r\n-DWITH_INNOBASE_STORAGE_ENGINE=1 \\\r\n-DWITH_MEMORY_STORAGE_ENGINE=1 \\\r\n-DWITH_READLINE=1 \\\r\n-DMYSQL_UNIX_ADDR=/var/lib/mysql/mysql.sock \\\r\n-DMYSQL_TCP_PORT=3306 \\\r\n-DENABLED_LOCAL_INFILE=1 \\\r\n-DWITH_PARTITION_STORAGE_ENGINE=1 \\\r\n-DEXTRA_CHARSETS=all \\\r\n-DDEFAULT_CHARSET=utf8 \\\r\n-DDEFAULT_COLLATION=utf8_general_ci\r\n\r\n提示 Warning : Bison  executable not found in PATH\r\n-	- configuring  done\r\n-	-Generating  done\r\n-	-Build  files  have benn write to :/root/mysql-5.5.12 \r\n说明编译好了  然后\r\nMake  &&  make  install 安装\r\n Cd  /usr/local/lnmp/mysql;/\r\nLs\r\nUseradd  -M –s /sbin/nologin  mysql  	不建立主目录，不登陆\r\nCd /usr/local/lnmp/mysql \r\nChown  -R  mysql.mysql  .\r\n安装数据表\r\n./scripts/mysql_initall_db  --user=mysql  --basedir=/usr/local/lnmp/mysql/  --datadir=/usr/local/lnmp/mysql/data/\r\n注：在启动MySQL服务时，会按照一定次序搜索my.cnf，先在/etc目录下找，找不到则会搜索\"$basedir/my.cnf\"，在本例中就是 /usr/local/mysql/my.cnf，这是新版MySQL的配置文件的默认位置！注意：在CentOS 6.4版操作系统的最小安装完成后，在/etc目录下会存在一个my.cnf，需要将此文件更名为其他的名字，如：/etc/my.cnf.bak，否 则，该文件会干扰源码安装的MySQL的正确配置，造成无法启动。\r\nVim /usr/local/lnmp/mysql/my.cnf\r\nbasedir =/usr/local/lnmp/mysql\r\ndatadir =/usr/local/lnmp/mysql/data\r\n# port = .....\r\n# server_id = .....\r\nsocket =/usr/local/lnmp/mysql/data/mysql.sock\r\n\r\nCd  support-files/\r\nCp  my-medium.cnf  /etc/my.cnf\r\nVi  mysql.server\r\nCp  mysql.server  /etc/init.d/mysqld  吧启动文件拷贝到/etc/init.d/mysqld \r\nCd  ..\r\nChown  -R  root   .   让root对此目录有权限但对data没有权限\r\nChown   -R  mysql  data\r\nCd  /usr/local/lnmp/mysql/bin  环境变量\r\nVi  ~/bash_profile 在环境变量后面增加：然后添加/usr/local/lnmp/mysql/bin\r\nSource  ~/.bash_profile\r\nEcho  $PATH 输出系统环境变量\r\nMysql 打开mysql \r\n提示错误ERROR 2002 (HY000): Can\'t connect to local MySQL server through socket \'/usr/local/mysql/data/mysql.scok\' (2)\r\n在/etc/my.cnf配置中指出sock文件的路径\r\n[mysql]\r\nsocket =/usr/local/lnmp/mysql/data/mysql.sock\r\n[mysqldump]\r\nsocket =/usr/local/lnmp/mysql/data/mysql.sock\r\n[mysqladmin]\r\nsocket =/usr/local/lnmp/mysql/data/mysql.sock\r\n[mysql_secure_installation]\r\nsocket =/usr/local/lnmp/mysql/data/mysql.sock\r\n2  源码编译安装nginx   可以到nginx.org上下载安装包可以在wiki.nginx.org 上查看官方文档\r\n	Tar  zxf  nginx-1.4.2.tar.gz\r\n	Cd nginx-1.4.2\r\nLess README\r\nCd  src/core/\r\nVi  nginx.h更改如下：\r\n#define  NGINX_VER   “nginx”   NGINX_VERSION   更改成：\r\n#define  NGINX_VER  “nginx”  用curl  -I  查看的版本可以在 着改\r\nCd  /nginx-1.4.2/auto/cc/\r\n Vi  gcc 更改如下：\r\n注解掉#CFLAGS=”$CFLAGS  -g”\r\nCd /nginx-1.4.2\r\n./configure   - - prefix=/usr/local/lnmp/nginx  - - with-h ttp_ssl_module - -with-http_stub_status_module  源码编译安装nginx 提示安装错误\r\n \r\nYum install  -y  pcre-devel 安装需要的模块  然后执行上一步\r\n然后 make  &&　ｍａｋｅ　ｉｎｓｔａｌｌ　\r\nCd  /usr/local/lnmp/nginx/\r\nDu  -sh  源码安装很小只有几百k\r\nCd  sbin/\r\nLn –s /usr/local/lnmp/nginx/sbin/nginx  /usr/local/sbin/\r\nWhich  nginx  \r\nCd .. \r\nCd  conf/\r\nUseradd –M  -s /sbin/nologin  nginx \r\nVi  nginx.conf 更改如下：\r\nUser  nginx  nginx ;\r\nWorker_processes  1 ;\r\n在  events {\r\n   Use   epoll  ;添加这行 启动nginx 优化\r\n	Worker_connections  1024\r\n}\r\nNginx  -t  检查nginx配置有没有语法错误\r\nNginx  启动ngnix \r\nNginx   -s  reload  重新装载nginx\r\nNginx  -s  stop  停止nginx\r\nCd /usr/local/lnmp/nginx/conf/\r\nVi nginx.conf 更改如下：\r\n添加\r\nLocation  /status {\r\n Stub_status  on ;\r\n Access_log  off;\r\n}吧这个添加上去就可以查看主机的状态了在浏览其中输入自己的ip/status 查看nginx的状态\r\n \r\nYum  install  vim  -y 如果没有vim则安装vim\r\n最近在学习nginx，nginx rewrite依赖于PCRE库，所以需要在linux系统中编译安装PCRE库。具体步骤如下：\r\n \r\n1.下载PCRE包\r\n首先去官网下载pcre的安装包\r\n如果通过FTP的方式，下载地址为：ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/\r\n如果通过http的方式，下载地址为：http://sourceforge.net/projects/pcre/files/pcre/\r\n目前最新的版本为8.32，linux对应的安装包名称为：pcre-8.32.tar.gz。\r\n \r\n2.把安装包上传到服务器，然后解压\r\nShell代码   \r\n[root@localhost local]# tar -zxvf pcre-8.32.tar.gz  \r\n \r\n解压之后在当前目录下生成了一个文件夹：pcre-8.32\r\nShell代码   \r\ndrwxr-xr-x 7 1169  1169    4096 Nov 30 18:50 pcre-8.32  \r\n \r\n3.配置\r\nShell代码   \r\n[root@localhost pcre-8.32]# ./configure  \r\n配置完之后控制台会打印出pcre配置的摘要信息\r\nShell代码   \r\npcre-8.32 configuration summary:  \r\n  \r\n    Install prefix .................. : /usr/local  \r\n    C preprocessor .................. : gcc -E  \r\n    C compiler ...................... : gcc  \r\n    C++ preprocessor ................ : g++ -E  \r\n    C++ compiler .................... : g++  \r\n    Linker .......................... : /usr/bin/ld  \r\n    C preprocessor flags ............ :   \r\n    C compiler flags ................ : -O2 -fvisibility=hidden  \r\n    C++ compiler flags .............. : -O2 -fvisibility=hidden -fvisibility-inlines-hidden  \r\n    Linker flags .................... :   \r\n    Extra libraries ................. :   \r\n  \r\n    Build 8 bit pcre library ........ : yes  \r\n    Build 16 bit pcre library ....... : no  \r\n    Build 32 bit pcre library ....... : no  \r\n    Build C++ library ............... : yes  \r\n    Enable JIT compiling support .... : no  \r\n    Enable UTF-8/16/32 support ...... : no  \r\n    Unicode properties .............. : no  \r\n    Newline char/sequence ........... : lf  \r\n    \\R matches only ANYCRLF ......... : no  \r\n    EBCDIC coding ................... : no  \r\n    EBCDIC code for NL .............. : n/a  \r\n    Rebuild char tables ............. : no  \r\n    Use stack recursion ............. : yes  \r\n    POSIX mem threshold ............. : 10  \r\n    Internal link size .............. : 2  \r\n    Match limit ..................... : 10000000  \r\n    Match limit recursion ........... : MATCH_LIMIT  \r\n    Build shared libs ............... : yes  \r\n    Build static libs ............... : yes  \r\n    Use JIT in pcregrep ............. : no  \r\n    Buffer size for pcregrep ........ : 20480  \r\n    Link pcregrep with libz ......... : no  \r\n    Link pcregrep with libbz2 ....... : no  \r\n    Link pcretest with libedit ...... : no  \r\n    Link pcretest with libreadline .. : no  \r\n    Valgrind support ................ : no  \r\n    Code coverage ................... : no  \r\n \r\n4.编译\r\n执行make操作：\r\nShell代码   \r\n[root@localhost pcre-8.32]# make  \r\n 编译完后可以执行make check进行测试（这一步非必须）\r\nShell代码   \r\nTesting pcregrep version 8.32 2012-11-30  \r\nTesting pcregrep main features  \r\nSkipping pcregrep UTF-8 tests: no UTF-8 support in PCRE library  \r\nTesting pcregrep newline settings  \r\nPASS: RunGrepTest  \r\n==================  \r\nAll 5 tests passed  \r\n==================  \r\nmake[2]: Leaving directory `/usr/local/pcre-8.32\'  \r\nmake[1]: Leaving directory `/usr/local/pcre-8.32\'  \r\n[root@localhost pcre-8.32]#   \r\n 上面的make check结果中有一句:\r\nShell代码   \r\nSkipping pcregrep UTF-8 tests: no UTF-8 support in PCRE library  \r\n 这是因为在前面步骤中执行./configuration配置时没有加上对utf-8的支持\r\n如果要加上对utf-8的支持可以在./configuration时加上参数：\r\nShell代码   \r\n[root@localhost pcre-8.32]# ./configure --enable-utf8  \r\n 配置完后再重新make\r\nmake完后再次执行make check结果如下：\r\nShell代码   \r\nTesting pcregrep version 8.32 2012-11-30  \r\nTesting pcregrep main features  \r\nTesting pcregrep UTF-8 features  \r\nTesting pcregrep newline settings  \r\nPASS: RunGrepTest  \r\n==================  \r\nAll 5 tests passed  \r\n==================  \r\nmake[2]: Leaving directory `/usr/local/pcre-8.32\'  \r\nmake[1]: Leaving directory `/usr/local/pcre-8.32\'  \r\n[root@localhost pcre-8.32]#  \r\n \r\n5.安装\r\n执行make install操作：\r\nShell代码   \r\n[root@localhost pcre-8.32]# make install  \r\n \r\nmake install结束后pcre编译安装流程就结束了。\r\n\r\n做nginx的加密\r\nVim  nginx.conf 更改如下：\r\n	Server {\r\n  Listen   443;\r\n	Server_name  localhost;\r\n	Ssl				on;\r\n	Ssl_certificate		cert.pem;\r\n	Ssl_certificate_key		cert.pem\r\n	Ssl_session_timeout		5ms\r\n	Ssl_protocols		SSLv2	SSLv3	TLSV1\r\n	Ssl_ciphers		HIGH;!aNULL:!MD；\r\n	Ssl_prefer_server_ciphers		on;\r\n\r\n	Location / {\r\n		Root		html;\r\n		Index	index.html  index.htm;\r\n}\r\n}\r\nCd  /etc/pki/tls/certs/\r\nLs\r\nMake   cert.pem  制作加密文件\r\nCp   cert.pem   /usr/local/lnmp/nginx/conf/\r\nNginx   -t \r\nNginx  -s  reload \r\nhttps://ip验证\r\nnginx虚拟主机配置\r\ncd  /usr/local/lnmp/nginx/conf\r\nvi nginx.conf\r\n在wiki.nginx上查看帮助文档虚拟主机配置复制从server{}起的内容到nginx的主配置文件的http{}中：更改如下：\r\n#### my  test\r\nhttp {\r\n server {\r\n listen          880;\r\n server_name     www.flybaobao1.com;\r\n# access_log      logs/mytest1.access.log main;\r\n location / {\r\n index index.html;\r\n root  /var/www/mytest1;\r\n }\r\n }\r\n server {\r\n listen          880;\r\n server_name     www.flybaobao2.com;\r\n# access_log      logs/mytest2.access.log main;\r\n location / {\r\n index index.html;\r\n root  /var/www/mytest2;\r\n }\r\n }\r\n}\r\n做测试\r\nMkdir  /var/www/mytest1  -p\r\nMkdir  /var/linux.org   -p\r\nCd   /www/westos.org  \r\nEcho  www.westos.org  >  index.html\r\nCd  /www/linux.org  \r\nEcho  www.linux.org   >   index.html\r\nVi  nginx.conf  更改如下：\r\n去掉http {\r\n   access_log      logs/mytest1.access.log main; 这三行的注解\r\n}\r\nNginx  -t  检测nginx配置有没有错误\r\nNginx  启动nginx\r\nNetstart   -antlp\r\n在主机里   vi  /etc/hosts添加：\r\n		Ip      www.westos.org   www.linux.org   让本机可以解析\r\n用一台apache 一台nginx做简单的负载均衡\r\n在新装一台虚拟机\r\nYum  install httpd  -y\r\n/etc/init.d/httpd  start  -y\r\nCd  /var/www/html/\r\nEcho  192.168.0.1   >  index.html\r\n在另外一台主机上\r\nCd   /var/www/html/\r\nEcho   192.168.0.2  >  index.html \r\n/etc/init.d/httpd  restart\r\nVi  /etc/httpd/conf/httpd.conf 吧接听端口改成8080\r\n/etc/init.d/httpd   restart \r\n在wiki.nginx.org查看负载均衡的事列\r\nCd  /usr/local/lnmp/nginx/conf/\r\nVi  nginx.cong更改如下：\r\n在http{}中添加\r\nhttp  {\r\n			upstream     westos{   负载的名称\r\n			server 	192.168.0.1:8080;\r\n			server   192.168.0.2:8080    weight=2; 权重访问俩次此主机访问一次上面的那台主机。\r\n}\r\nInclude			mime.types;\r\n Location  / {\r\n	Proxy_pass   http://westos; 负载名称和上面的对应\r\n}\r\n}\r\n	Nginx   -t \r\n	Nginx   -s    reload 重新装载\r\nPhp  源码安装  最麻烦\r\nyum install gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers -y\r\nTar    jxf   php-5.4.12.tar.bz2 \r\n安装php之前要先安装加强系统对支持字符编码装换的功能\r\nLibiconv   \r\nTar   zxf   libiconv-1.13.1.tar.gz\r\nCd  libiconv-1.13.1\r\n./configure  --libdir=/usr/local/lib64/\r\nMake  && make  install \r\n安装完就可以在/usr/local/lib64中看到了原来的解压包就可以删除了\r\nRm  -fr   libiconv-1.13.1\r\nTar   jxf  libmcrypt-2.5.8.tar.bz2\r\nCd  libmcrypt-2.5.8\r\n./configure   --libdir=/usr/local/lib64/\r\n Make  &&　ｍａｋｅ　　ｉｎｓｔａｌｌ\r\n　Cd  /libmcrypt-2.5.8/libltd\r\n./configure   --libdir=/usr/local/lib64/  --enable-ltdl-install\r\nMake  && make  install \r\nTar  jxf  mhash-0.9.9.9.tar.bz2\r\nCd  mhash-0.9.9.9\r\n可以用./configure  查看编译的帮助\r\n./configure  --libdir=/usr/local/lib64/\r\nMake   &&  make  install\r\nLdconfig   /usr/local/lib4/  加载刚安装的库文件\r\nVi  /etc/ld.so.conf  可以在此种添加 /usr/local/lib64 开机自动加载\r\nTar   zxf  mcrypt-2.6.8.tar.gz \r\nCd  mcrypt-2.6.8\r\n./configure   --libdir=/usr/local/lib64/\r\nMake  && make  install\r\nTar  zxf  php-5.4.12.tar.gz\r\nCd  php-5.4.12\r\n./configure \\\r\n--prefix=/usr/local/lnmp/php \\\r\n--with-config-file-path=/usr/local/lnmp/php/etc \\\r\n--with-mysql=/usr/local/lnmp/mysql/ \\\r\n--with-openssl  \\\r\n--with-snmp  \\\r\n--with-gd  \\\r\n--with-zlib  \\\r\n--with-curl \\\r\n--with-libxml-dir  \\\r\n--with-png-dir  \\\r\n--with-jpeg-dir  \\\r\n--with-freetype-dir \\\r\n--with-pear  \\\r\n--with-mysqli=/usr/local/lnmp/mysql/bin/mysql_config  \\\r\n--enable-fpm  \\\r\n--with-fpm-user=nginx  \\\r\n--with-fpm-group=nginx \\\r\n--with-libdir=lib64  \\\r\n--with-mcrypt  \\\r\n--with-mhash\r\n编译但提示有错误有依赖关系需要安装的依赖有\r\nYum  install –y libxml-devel net-snmp-devel  curl-devel  libxml2-devel  libpng-devel  libjpeg-devel  freetype-devel  gmp-devel  openldap-devel\r\n然后再编译\r\nCd  /usr/local/lnmp/mysql/\r\nLn  -s  lib/   lib64  做连接不然php编译的时候找不到mysql的库文件\r\nCd php-5.4.12 \r\n然后编译\r\nMake  ZEND_EXTRA_LIBS=‘-liconv’\r\nMake  install\r\n Php 源码编译安装完了\r\nCd  /usr/local/lnmp/php/\r\n添加环境变量\r\nvim ~/.bash_profile\r\nPATH=$PATH:$HOME/bin:/usr/local/lnmp/mysql/bin:/usr/local/lnmp/php/bin\r\nsource ~/.bash_profile\r\nCd ~/php-5.4.12 \r\nCp  php.ini-production  /usr/local/lnmp/php/php.ini\r\nCd  sapi/fpm\r\nCp  -d  php-fpm  /etc/init.d/fpm   添加到启动脚本\r\nChmod  +x  /etc/init.d/fpm\r\n/etc/init.d/fpm   star   可以在此启动php了\r\nCd  /usr/local/lnmp/php/etc/\r\nCp  php-fpm.conf.default   php-fpm-conf\r\nVi   php-fpm.conf   更改如下：\r\n去掉;pid = run/php-fpm.pid  的注解\r\n/etc/init.d/fpm   start    启动php\r\nNetstat  -natple  查看启动的脚本\r\nCd  /usr/local/lnp/nginx/conf/\r\nVim  nginx.conf  更改如下：\r\n去掉下面的注解并更改如下：\r\n   	Location  ~ \\ .php$ {\r\n						Root			html;\r\n						Fastcgi_pass	127.0.0.1:9000;启用fastcgi的方式\r\n						Fastcgi_index		index.php  默认打开的主页\r\n					   #fastcgi_param				SCRIPT_FILENAME\r\n/scripts$fastcgi_script_name;\r\n						Include		fastcgi.conf; 更改成\r\n}   \r\nNginx   -t   检测配置有没有错误\r\nNginx   -s   reload  重新加载\r\nCd  /usr/local/lnmp/nginx/html/\r\nVi  index.php   编写测试页面\r\n<?php\r\nPhpinfo()\r\n?>\r\n在浏览器中输入本机ip/index.php   看是否能出现php信息出现则表示php安装成功\r\nNetstat   -antple \r\n在lnmp平台搭建Discuz论坛平台 \r\n/etc/init.d/mysqld    start   启动mysql\r\nUnzip		Discuz_x2.5_SC_UTF8.zip如果提示没有unzip 则\r\nYum install   -y  unzip  安装此解压软件\r\n解压完多了俩个目录readme  和upload \r\nCd   readme  \r\nLess   readme.txt  查看安装说明\r\nMv    upload/    /usr/local/lnmp/nginx/html/bbs/\r\nCd  /usr/local/lnm/nginx/html/bbs/\r\nChown   nginx   .   -R 更改属主\r\n在浏览器中输入：本机ip/bbs/install/upload/index.php    安装论坛\r\n如果输入install 访问不到index.php 则更改nginx的主配置文件\r\nCd  /usr/local/lnmp/nginx/conf/\r\nVi  nginx.conf  如下\r\n在 location   /  {\r\n			Index   中添加index.php  \r\n}\r\nNginx  -s   reload   就好了\r\n按照提示安装就吧论坛搭建好了\r\n给php添加功能扩展模块下面重新安装php和nginx （可以不重新安装）\r\nYum install  -y   httpd  php\r\n/etc/init.d/httpd   start\r\nCd   /var/www/htm/\r\nVi  index.php  编写测试页看apache是否支持php\r\n<?php\r\nPhpinfo()\r\n?>\r\nYum  list  php*查看系统上的php  rpm  包\r\nYum install  php-gd.x86_64\r\nCd  /etc/php.d/\r\n  Ls  此目录下多了个gd.ini \r\n源码编译安装nginx \r\nUseradd   -M  -s  /sbin/nologin   nginx\r\nTar   zxf  nginx-1.4.2.tar.gz\r\nCd  nginx-1.4.2\r\nCd   src/core/\r\nVi  nginx.h 更改如下：\r\n#define	NGINX_VER			“nginx/” NGI 改成  别的或去掉双引号后面的让别人查不到你主机的信息和nginx的版本  \r\n#define	NGINX_VER	 “westos” 这样也可以定制自己的服务器\r\nCd ../../auto/cc/  \r\nVi  gcc\r\n吧# debug下面的行注解掉\r\n#CFLAGS=”CFLAGS  -g ”  这样安装的快和小\r\nYum  install make  gcc gcc-c++ cmake  安装需要的编译软件\r\nCd  ~/nginx-1.4.2  \r\n./configure   --help  可以查看configure需要的参数\r\n会提示错误\r\n./configure   - -with-http_ssl_module   - -with-http_stub_status_module  \r\nYum   install  pcre-devel  openssl-devel   -y 安装完后在编译\r\n./configure   - -with-http_ssl_module   - -with-http_stub_status_module  然后\r\nMake   &&  make  install  默认安装到/usr/local/nginx/\r\nCd  /usr/local/nginx/\r\nCd conf/\r\nVi  nginx.conf 更改如下：\r\nUser			nginx   nginx; 用户和组都是nginx\r\nWorker_processes  2;启动俩个进程\r\nEvents  {\r\n		Use  epoll;\r\n		Worker_connections		1024;\r\n}\r\nLn   -s  /usr/local/nginx/sbin/nginx			/usr/local/sbin/ 做软连接让系统能找到nginx\r\nWhich  nginx    查看\r\nNginx   -t  检查语法错误\r\nNginx  启动nginx\r\nNetstat   -natple  查看端口\r\nCurl   -I   localhost   查看服务器信息\r\n搭建支持jsp的平台\r\n安装jdk  jdk-6u32-linux-x64.bin\r\nSh  jdk-6u32-linux-x64.bin 安装完后\r\nMv   jdk1.6.0_32/    /usr/local/jdk\r\nalias  vi=vim\r\nvi   ~/.bashrc   这是用户级别的\r\nalias  vi=’vim’ \r\nvi   /etc/profile  这是系统的环境变量更改如下：\r\nexport   JAVA_HOME=/usr/local/jdk\r\nexport   CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib\r\nexport	PATH=$PATH:$JAVA_HOME/bin     前面的$PATH是系统的环境变量\r\nsource   /etc/profile   重新加载系统变量\r\necho  $JAVA_HOME\r\necho   $PATH\r\n安装发布jsp网站的软件tomcat\r\nTar  zxf  apache-tomcat-7.0.37.tar.gz   -C  /usr/local/\r\nLn   -s   apache-tomcat-7.0.37/    tomcat\r\nCd   /usr/local/tomcat/bin\r\n./startup.sh    启动tomcat\r\nNetstat   -natple  | grep  8080  tomcat监听8080端口\r\n在浏览器输入ip:8080/就可以看到tomcat的欢迎页面\r\nCd   /usr/local/tomcat/webapps/ROOT/\r\nVi   test.jsp\r\nThe  Time  is :<%=new  java.util.Date() %> 编写测试页\r\n在浏览器输入ip:8080/test.jsp   可以查看是否安装好\r\n如果想在浏览器中输入时不带端口号要更改nginx配置\r\nCd  /usr/local/nginx/conf/\r\nVi nginx.conf 更改如下：\r\n添加\r\nLocation  ~ \\ . jsp$ {\r\n    Proxy_pass		http://127.0.0.1:8080;\r\n}\r\nNginx    -t  \r\nNginx   -s   reload\r\nPhp-cgi   --help\r\nPhp-cgi  -b  127.0.0.1:9000   然后ctrl+Z打入后台\r\nFg   调到前台\r\n这样就可以在浏览器中输入ip/index.php    查看php网站了\r\n安装spawn-fcgi-1.6.3-1.el6.x86_64.rpm\r\nRpm   -ql    spawn-fcgi  查看系统上的版本\r\nVi   /etc/sysconfig/spawn-fcgi 更改如下：\r\n添加  \r\nOPTIONS=”-u  nginx  -g  nginx  -a  127.0.0.1  -p  9000   -C  5  -P  /var/run/spawn-fcgi.pid  -- /usr/bin/php-cgi”\r\n/etc/init.d/spawn-fcgi   start\r\n启动报错，因为它启动默认的是找/usr/bin/php 程序，如果你的php程序不再这个地方就启动不了，ln -s /usr/local/lnmp/php/bin/* /usr/bin/\r\n安装memcache模块系统必须有phpize 没有的话安装php-devel 系统rpm包有，没有的话网上下载并安装\r\nYum localinstall  php-devel-5.3.3-22.el6.x86_64.rpm\r\n安装memcached\r\ntar   zxf  memcahced-1.4.15.tar.gz\r\nfree   -m  查看内存中的空闲\r\ncd   /memcached-1.4.15\r\n./configure   提示错误\r\n \r\n需要安装三个包libevent-devel    libevent-doc   libevent-headers\r\nYum  localinstall  libevent-*\r\n./configure\r\nMake   &&　ｍａｋｅ　　　ｉｎｓｔａｌｌ　\r\n/etc/init.d/memcached  start\r\n/usr/local/memcached/bin/memcached -d   -u  root 注：启动memcached\r\n \r\nmemcached启动参数描述：\r\n-d ：启动一个守护进程，\r\n-m：分配给Memcache使用的内存数量，单位是MB，默认是64MB，\r\n-u ：运行Memcache的用户\r\n-l  ：监听的服务器IP地址\r\n-p ：设置Memcache监听的端口，默认是11211    注：-p（p为小写）\r\n-c ：设置最大并发连接数，默认是1024\r\n-P ：设置保存Memcache的pid文件   注：-P（P为大写）\r\n如果要结束Memcache进程，执行：kill cat pid文件路径\r\n\r\nNetstat   -antple  |  grep  11211\r\ntelnet  localhost  11211 测试\r\nadd  user  0  0   5  在内存中添加一个名字为user 编号为0不检查的5个字节打下的空间\r\ndelete   user  删除\r\ntar   zxf  memcache-2.2.5.tgz\r\ncd   memcache-2.2.5\r\n里面没有./configure  文件\r\n用行phpize  就有了\r\n./configure\r\n./configure --with-php-config=/usr/local/lnmp/php/bin/php-config\r\nMake   install 安装到了/usr/lib64/php/modules/\r\nCd  /usr/lib64/php/modules/\r\nLs\r\nVi  /usr/local/lnmp/php/php.ini  更改如下：\r\nextension_dir = \"/usr/local/lnmp/php/lib/php/extensions/no-debug-non-zts-2013122\r\n6\"\r\nextension = \"memcache.so\"\r\nextension = \"pdo_mysql.so\"\r\nextension = \"imagick.so\"\r\n/etc/init.d/spawn-fcgi  reload\r\nCd  ~/memcache-2.2.5\r\nCp  memcache.php  /usr/local/nginx/html/\r\nCd  /usr/local/nginx/html/\r\nVi  memcache.php 更改如下：\r\nDefine(‘ADMIN_USERNAME,’admin’)用户\r\nDefine(‘ADMIN_PASSWORD’,’westos’)密码\r\n$MEMCACHE_SERVER[] = ‘192.168.0.194:11211’;本机使用\r\n#注解掉下面的哪行因为只有一台主机在用，\r\n在浏览器输入ip/memcache.php可以查看是否配置\r\n \r\n安装memcache的图形化界面\r\ncd /usr/local/lnmp/nginx/html\r\n wget http://www.junopen.com/memadmin/memadmin-1.0.12.tar.gz\r\n tar xf memadmin-1.0.12.tar.gz\r\n cd memadmin\r\nhttp://192.168.11.188/memadmin/index.php\r\n \r\n用户名和密码都为admin\r\n \r\n \r\n安装webbench网站测试工具\r\nTar   zxf  webbench-1.5.tar.gz\r\nCd   webbench-1.5.tar.gz\r\nVi  makefile \r\nMake    编译提示错误\r\n \r\nYum  install   -y   ctags\r\nMake  成功后\r\nMake   install 提示错误\r\n \r\nMkdir   /usr/local/man/man1   -p\r\nMake   install \r\nWebbench  -c(并发量)   -t(并发时间) http://192.168.0.194/index.php\r\nnginx和memcached集合\r\nnginx的数据也可以换成在memcache中，配置如下\r\n1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15	server {\r\n        listen       80;\r\n        server_name  www.wangfeng7399.com;\r\n        #charset koi8-r;\r\n        #access_log  logs/host.access.log  main;\r\n        location / {\r\n                set $memcached_key $uri;\r\n                memcached_pass     192.168.1.202:11211;\r\n                default_type       text/html;\r\n                error_page         404 @fallback;\r\n        }\r\n        location @fallback {\r\n                proxy_pass http://192.168.1.201;\r\n        }\r\n}\r\n\r\n用nginx和tomcat做负载均衡前面一台nginx后面挂俩台tomca一个ip连接一台主机，只有ip变了，主机才变\r\n先做负载均衡\r\nCd  /usr/local/nginx/conf\r\nVi  nginx.conf 更改如下：\r\nhttp {\r\n	upstream   westos {\r\n		server  192.168.0.194:8080;端口8080是tomcat监听的\r\n		server	192.168.0.197:8080;\r\n}\r\nLocation		~ \\.jsp$ {\r\n	Proxy_pass		http://westos;\r\n}\r\n}\r\nNginx  -t\r\nNginx   -s  reload  \r\n在俩台主机上配置jsp网站平台。和前面一样，安装jdk配置环境变量测试tomcat是否能发布jsp网站\r\n如果tomcat的主页不出来图片则  vi   nginx.conf添加\r\nLocation  ~ \\.(png|gif|cs|js|jpg)$ {\r\n	Root  /usr/local/tomcat/webapps/ROOT;\r\n}\r\n要实现此功能必须重新编译nginx \r\nCd  ~/nginx-1.4.2  \r\nMake   clean\r\nMake  tidy \r\n需要的安装包是nginx-sticky-module-1.0.tar.gz\r\nTar   zxf   nginx-sticky-module-1.0.tar.gz\r\nCd  ~/nginx-1.4.2 \r\n./configure  - -with-http_ssl_module   - -with-http_stub_status_module  - -add-module=/root/nginx-sticky-module-1.0\r\nNginx   -s  stop\r\n如果提示错误则更改nginx的住配置文件，注解掉sticky哪行\r\nNginx   -t\r\nNginx   -s   reload\r\n\r\nNginx   -s   stop\r\nMake    &&    make    intall \r\nVi   nginx.conf  更改如下：\r\nhttp {\r\n	upstream   westos {\r\n	sticky;\r\n	server  192.168.0.194:8080;\r\n	server  192.168.0.197:8080;\r\n}\r\n}\r\nNginx   -t  \r\nNginx\r\n这样就一个ip访问一台主机\r\n','2014-12-16 02:33:00','','',0,0,0),(2,'lvs搭建','本文介绍如何在linux搭建高可用lvs环境','lvs搭建DR方式（lvs有三种工作方式进行负载均衡技术）\r\n一台主机做DR主机（可以是HA主机），俩太做RS(Real Server)\r\n在DR主机上\r\nyum  install  -y  ipvsadm \r\n在RS主机上\r\nyum  insatll -y httpd \r\nyum install -y httpd \r\n在DR打开一个虚拟网卡，网卡配置虚拟ip（VIP 与真实ip要在同一个网段）\r\nifconfig  eth0:0 192.168.0.92 netmask 255.255.255.0 up\r\nipvsadm  -A -t 192.168.0.92:80 -s rr (-A给DH主机增添规则 -t tcp rr 轮寻)\r\nipvsadm  -a -t 192.168.0.92:80 -r 192.168.0.117:80 -g\r\nipvsadm  -a -t  192.168.0.92:80 -r 192.168.0.141:80 -g (-a增添RS)\r\nipvsadm  -l  查看\r\n/etc/init.d/ipvsadm   save  保存\r\nchkconfig  ipvsadm  on \r\n在RS主机上开启web服务,俩太RS主机分别添加(lvs不像HA那样可以自动开启服务，要手动开启)\r\n/etc/init.d/httpd start \r\n/etc/init.d/httpd start\r\nifconfig  eth0:0 192.168.0.92 netmask 255.255.255.255 up 增添VIP\r\necho   `hostname` > /var/www/html/index.html\r\nifconfig  eth0:0 192.168.0.92 netmask 255.255.255.255 up RS也要有VIP\r\necho   `hostname` > /var/www/html/index.html\r\n在测试机上arp   -a  查看arp\r\narp   -a  192.168.0.92\r\n此时可以访问VIP但不能负载，因为arp装换功能开启的了，DR要是no-arp有俩中方法可以关闭apr，一种是在内核中关闭，另外一种是用红冒的工具arptables_jf 进行设置\r\n在RS俩台主机上\r\nyum   install  -y arptables_jf\r\nyum install -y arptables_jf\r\narptables  -A IN -d 192.168.0.92 -j DROP  进来的包拒绝掉\r\narptables  -A OUT -s 192.168.0.92 -j mangle --mangle-ip-s 192.168.0.141（RS的ip）\r\narptables  -L  查看\r\n/etc/init.d/arptables_jf  save\r\n另外一台上\r\narptables  -A  IN  -d 192.168.0.92 -j DROP\r\narptables  -A  OUT -s 192.168.0.92 -j mangle --mangle-ip-s 192.168.0.117\r\narptables  -L\r\n/etc/init.d/arptables_jf    save\r\n此时就可以实现负载了\r\n在测试机上\r\narp  192.168.0.92 查看92的mac是否来自DR主机\r\nipvsadm  -l  查看访问的次数\r\nlvs的DR只负责吧服务交给RS主机不管RS主机是否健康，当RS主机坏掉以后，服务不用行了。\r\n\r\n2 HA和lvs的结合（iptables和selinux必须关闭）\r\n用俩太DR主机做HA。俩太主机做RS\r\n在DR主机上\r\nyum  install -y ipvsadm  piranha (server94)\r\n\r\nyum  install -y ipvsadm  piranha (server51)\r\nipvsadm  -l 查看规则\r\nipvsadm  -C 去掉以前的规则\r\n\r\n在HA的master主机上（server51）\r\npiranha-passwd  为piranha更改密码\r\n/etc/init.d/piranha-gui  start\r\nnetstat  -antlp |grep 3636 次服务接听的是httpd的3636端口\r\n在浏览器中输入192.168.0.151:3636(HA主机的地址和监听的端口)\r\n单击login输入用户名和密码（user Name： piranha password ：刚才更改的密码）\r\n在HA master主机上 cd  /etc/sysconfig/ha/(配置信息存放的地点lvs.cf)\r\ncat  lvs.conf 查看配置信息\r\n在浏览器中\r\n单击GLOBAL SETTING---->Primary server public IP(192.168.0.151填写HAmaster主机的IP)——————>下面选择三种工作方式的一种(本次实验选择Direct Routing)---->ACCEPT\r\n单击REDUNDANCY--enable----->Redundant server public IP:(192.168.0.194HA备用主机的ip)--->Heartbeat interval(seconds检测心跳的时间)（填写2）----->Assume dead after(seconds)(10)---->Heartbeat runs on port(539心跳检测监听的端口)----Monitor NIC links for failures(选中)---->ACCEPT\r\n单击VIRTUAL SERVERS-add--->EDIT---->Name(www)--->Application port(80)----->Protocol(tcp)--->Virtual ip address(192.168.0.92 VIP)---->Virtual IP Network Mask(255.255.255.0)----Device(eth0:1)--->Re-entry Time(15)--->Server timeout(6)--->Quiesce server（no）---->Load monitoring tool(none)----Scheduling(Round robin算法)---->Persistence Network Mask(Unused)----ACCEPT\r\n单击REAL SERVER----->add--->Name(server17.example.com)---->Address(192.168.0.117)---->Port(80)------>weight(1)----->ACCEPT\r\nREAL SERVER----->add---->Name(server41.example.com)---->Address(192.168.0.141)---->Port(80)---->Weight(1)----->ACCEPT\r\nMONITORING SCRIPTS（监控脚本默认不变）----->ACCEPT\r\nREAL SERVER ----->(选中RS主机)----->(D)ACTIVATE(让RS主机up，启动)\r\nVIRTUAL SERVER----->(选中服务www)----->(De)ACTIVATE让www服务up，启动\r\nscp /etc/sysconfig/ha/lvs.cf 192.168.0.194:/etc/sysconfig/ha/ 吧此配置文件复制到HA备份主机上\r\n/etc/init.d/pulse   start(server51)\r\nipvsadm  -l 自动获得RS的信息，不要手动填写规则了\r\nifconfig  自动启动了eth0:1 这个VIP\r\n/etc/init.d/pulse   start(server94)\r\n此时HA和lvs结合就配置好了，吧如果RS主机坏掉，HA主机可以自动检测到，并从规则列表中删除，如果RS主机再次好了，HA主机在次吧它添加进来，如果HA主机的master挂掉，HA的backup自动接受服务，当master好了后，依然是backup主机工作，直到backup主机挂掉，master主机才再次接受服务。\r\n\r\n\r\n\r\nLvs keepalived 配置\r\n! Configuration File for keepalived\r\n\r\nglobal_defs {\r\n   notification_email {\r\n     monitor@dlb666.com\r\n   }\r\n   notification_email_from root@localhost\r\n   smtp_server 127.0.0.1\r\n   smtp_connect_timeout 30\r\n   router_id LVS_DEVEL\r\n}\r\n\r\nvrrp_instance VI_1 {\r\n    state MASTER\r\n    interface eth0\r\n    virtual_router_id 61\r\n    priority 100\r\n    advert_int 1\r\n    authentication {\r\n        auth_type PASS\r\n        auth_pass dlb666.com\r\n    }\r\n    virtual_ipaddress {\r\n        192.168.75.222\r\n        192.168.75.202\r\n    }\r\n}\r\nvrrp_instance VI_2 {\r\n    state MASTER\r\n    interface eth1\r\n    virtual_router_id 51\r\n    priority 100\r\n    advert_int 1\r\n    authentication {\r\n        auth_type PASS\r\n        auth_pass dlb666.com\r\n    }\r\n    virtual_ipaddress {\r\n        192.168.76.222\r\n        192.168.76.202\r\n    }\r\n}\r\n\r\nvirtual_server 192.168.75.222 880 {\r\n    delay_loop 3\r\n    lb_algo rr\r\n    lb_kind DR\r\n    persistence_timeout 900\r\n    protocol TCP\r\n\r\n    real_server 192.168.75.102 880 {\r\n        weight 7\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 880\r\n        connect_timeout 3\r\n        }\r\n    }\r\n\r\n   real_server 192.168.75.112 880 {\r\n        weight 7\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 880\r\n        connect_timeout 3\r\n        }\r\n}\r\n\r\n  real_server 192.168.75.121 880 {\r\n        weight 7\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 880\r\n        connect_timeout 3\r\n        }\r\n    }\r\n    real_server 192.168.75.122 880 {\r\n        weight 7\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 880\r\n        connect_timeout 3\r\n        }\r\n    }\r\n}\r\n\r\nvirtual_server 192.168.75.202 80 {\r\n    delay_loop 3\r\n    lb_algo wlc\r\n    lb_kind DR\r\n    persistence_timeout 900\r\n    protocol TCP\r\n\r\n\r\n   real_server 192.168.75.131 80 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n    real_server 192.168.75.132 80 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n     real_server 192.168.75.133 80 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n       real_server 192.168.75.134 80 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n}\r\n\r\n\r\nvirtual_server 192.168.75.202 9999 {\r\n    delay_loop 3\r\n    lb_algo wlc\r\n    lb_kind DR\r\n    persistence_timeout 900\r\n    protocol TCP\r\n\r\n\r\n   real_server 192.168.75.131 9999 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n    real_server 192.168.75.132 9999 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n     real_server 192.168.75.133 9999 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n        real_server 192.168.75.134 9999 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n}\r\n\r\n\r\nvirtual_server 192.168.76.222 880 {\r\n    delay_loop 3\r\n    lb_algo rr \r\n    lb_kind DR\r\n    persistence_timeout 900\r\n    protocol TCP\r\n\r\n\r\n    real_server 192.168.76.102 880 {\r\n        weight 7\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 880\r\n        connect_timeout 3\r\n        }\r\n   }\r\n    real_server 192.168.76.112 880 {\r\n        weight 7\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 880\r\n        connect_timeout 3\r\n        }\r\n    }\r\n  real_server 192.168.76.121 880 {\r\n        weight 7\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 880\r\n        connect_timeout 3\r\n        }\r\n    }\r\n    real_server 192.168.76.122 880 {\r\n        weight 7\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 880\r\n        connect_timeout 3\r\n        }\r\n    }\r\n}\r\n\r\nvirtual_server 192.168.76.202 80 {\r\n    delay_loop 3\r\n    lb_algo wlc\r\n    lb_kind DR\r\n    persistence_timeout 900\r\n    protocol TCP\r\n\r\n\r\n    real_server 192.168.76.131 80 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n    real_server 192.168.76.132 80 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n    real_server 192.168.76.133 80 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n       real_server 192.168.76.134 80 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n}\r\n\r\n\r\n\r\n\r\nvirtual_server 192.168.76.202 9999 {\r\n    delay_loop 3\r\n    lb_algo wlc\r\n    lb_kind DR\r\n    persistence_timeout 900\r\n    protocol TCP\r\n\r\n\r\n    real_server 192.168.76.131 9999 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n    real_server 192.168.76.132 9999 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n    real_server 192.168.76.133 9999 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n        real_server 192.168.76.134 9999 {\r\n        weight 5\r\n        TCP_CHECK {\r\n        nb_get_retry 1\r\n        delay_before_retry 3\r\n        connect_port 80\r\n        connect_timeout 3\r\n        }\r\n    }\r\n}','2014-12-16 05:24:00','','',0,0,0),(3,'nagios安装，部署','本文介绍如何在linux下安装nagios监控','1安装 nagios(中文版本的)\r\nGet  nagios-cn-3.2.3.tar.bz2   nagios-plugins-1.4.16.tar.gz\r\nwww.nagios.org  官网下载安装包和查看文档\r\ntar   jxf  nagios-cn-3.2.3.tar.bz2\r\ncd   /nagios-cn-3.2.3\r\n./configure\r\nUseradd  nagios\r\nUsermod   -G   nagios   apache\r\nYum  install  -y  perl-ExtUtils-Embed \r\nRpm  -q  gd  查看系统上gd的版本号\r\nYum  list  gd  查看安装包的gd版本\r\nGet  gd-devel-2.0.35-11.el6.x86.rpm\r\nYum  localinstall  gd-devel-2.0.35-11.el6.x86.rpm\r\n./configure   --enable-embedded-perl  配置完成后\r\nMake  all\r\nMake    install\r\nMake   install-init\r\nMake   install-commandmode\r\nMake  install-config\r\nMake  install-webconf\r\nCd  /usr/local/nagios/\r\nCd  etc/\r\nVi  nagios.cfg  主配置文件\r\nCd   objects/\r\nVi  commands.cfg  命令配置文件\r\nCd  /usr/local/nagios/libexec/\r\nTar   zxf  nagios-plugins-1.4.16.tar.gz\r\nCd  nagios-plugins-1.4.16\r\n./configure  --enable-extra-opts  --enable-perl-modules  --enable-libtap\r\nmake \r\nmake install\r\nCd  /usr/local/nagios/libexec/\r\nChown  nagios.nagios   *\r\n/usr/local/nagios/bin/nagios  -v  /usr/local/nagios/etc/nagios.cfg 检查语法错误\r\nTotal  Warnings:0 \r\nTotal  Errors:0 说明没有错误\r\n/etc/init.d/nagios   restart\r\nCd  /etc/httpd/conf.d/\r\nCat  nagios.conf\r\nCat  /usr/local/nagios/etc/htpasswd.users\r\nCd  /usr/local/nagios/etc/ \r\nMv htpasswd.user   htpasswd.users\r\nHtpasswd  -m  /usr/local/nagios/etc/htpasswd.users  nagiosadmin  更改nagios的ssl密码它是加密访问的\r\nCat   /usr/local/nagios/etc/htpasswd.uers  验证密码\r\n/etc/init.d/httpd   restart\r\nhttps://ip/nagios\r\n输入用户名和密码\r\nYum  install  -y  mailx\r\nCd  /usr/local/nagios/etc/\r\nVi  nagios.cfg 更改如下：\r\n（Cfg_file=/usr/local/nagios/etc/objects/hosts.cfg原来的）吧主机配置和服务配置分开\r\ncfg_file=/usr/local/nagios/etc/objects/host187.cfg\r\ncfg_file=/usr/local/nagios/etc/objects/server187.cfg\r\nCd  objects/\r\nCp  -p  localhost.cfg   hosts.cfg\r\nCp  -p  localhost.cfg    servers.cfg\r\nVi   hosts.cfg 更改如下：\r\n Define  host{\r\n			Use					linux-server\r\n			Host_name			server67.example.com\r\n			Alias				Manager\r\n			Address				192.168.0.196\r\n			Icon_image			server.gif\r\n			Statusmap_image		server.gd2\r\n			2d_coords			500,200\r\n			3d_coords			500,200,100\r\n}\r\nDefine  hostgroup{\r\n		Hostgroup_name		linux-server\r\n	Alias					linux  Server\r\n	Members				*\r\n		}\r\nVi servers.cfg更改如下：\r\n删除掉所有的hosts,替换所有的田朝阳家用机为server96.example.com\r\n:%s/田朝阳家用机/server96.example.com/g\r\nDefine  servicegroup{\r\n	Servicegroup_name  系统负荷检查\r\n	Alias					负荷检查\r\n	Members server96.example.com,进程总数,server96.example.com,登录用户数,server96.example.com,更分区,server96.example.com,交换空间利用率\r\n}（只留一个servergroup）\r\n/usr/local/nagios/bin/nagios  -v  /usr/local/nagios/etc/nagios.cfg  检查语法错误\r\n/etc/init.d/nagios   restart\r\n用nagios监控另外一台主机上的mysql \r\nServer27 上yum  install mysql-server\r\n/etc/init.d/mysqld   restart\r\nMysql \r\nCreate  database  nagdb;\r\nGrant  select  on  nagdb.*   to  nagios@’192.168.0.196’ ;\r\nServer96  上\r\nCd  /usr/local/nagio/libexec  \r\n./check_mysql  --help\r\n./check_mysql   -H  192.168.0.127   -u  nagios  -d  nagdb\r\nCd  /usr/local/nagios/etc/objects/\r\nVi   commands.cfg  更改如下：\r\n#’check_mysql’  command  definition\r\nDefine   command{\r\n		Command_name		check_mysql\r\n	Command_line		$UER1$/check_mysql  -H  $HOSTADDRESS$  -u  $ARG1$  -d   $ARG2$\r\n}\r\nVi  hosts.cfg更改如下：\r\ndefine host{\r\n        use     linux-server\r\n        host_name       mytest2\r\n        alias           mysql\r\n        address         192.168.11.185\r\n        icon_image      server.gif\r\n        statusmap_image server.gd2\r\n        2d_coords       400,100\r\n        3d_coords       400,100,50\r\n}\r\nVi   services.cfg更改如下：\r\ndefine service{\r\n        use             local-service\r\n        host_name       mytest2\r\n        service_description     MySQL\r\n        check_command   check_mysql!nagios!cactidb\r\n}\r\n/usr/local/nagios/bin/nagios  -v   /usr/local/nagios/etc/nagios.cfg   检查语法错误\r\n/etc/init.d/nagios  reload\r\nVi   contacts.cfg  设置监控的内容出现错误时email通知的地址\r\nDefine  contact{\r\n	Contact_name			nagiosadmin\r\n	Use					generic-contact\r\n	Alias					Nagios  Admin\r\n	Email				yakexi007@westos.org\r\n}\r\n/etc/init.d/nagios   reload\r\nnagios安装好后，网页访问出现如下错误：\r\n无权查看任何主机的信息。\r\n请检查HTTP服务器关于该CGI的访问权限设置。\r\n解决办法：\r\nvi /usr/local/nagios/etc/cgi.cfg\r\n将use_authentication的值改为0.\r\nuse_authentication=0\r\n然后重启nagios服务\r\nservice nagios restart\r\n还有可能：\r\n配置文件中的hostname和service_description使用了中文。\r\n建议hostname和service_description 不要使用中文\r\n\r\nSu   - nagios  \r\nMail  yakexi007@westos.org  发送测试邮件\r\n在/usr/locl/nagios/var/ 查看nagios的日志nagios.log\r\n用nagios监控其他主机的磁盘，用户，根分区等要在所要监控的织机上安装nagios的插件\r\nServer27\r\nGet  nrpe-2.14.tar.gz\r\nTar   zxf   nrpe-2.14.tar.gz\r\n在 nrpe-2.14/docs/查看安装步骤\r\nEvince   NRPE.pdf  &\r\nUseradd  nagios  \r\nGet  nagios-plugins-1.4.16.tar.gz\r\nTar   nagios-plugins-1.4.16.tar.gz\r\nCd  nagios-plugins-1.4.16\r\nYum  install  gcc  make  -y\r\n./configure  配置出现如图但要支持那些功能\r\n \r\nYum  install –y  mysql-devel  openssl-devel\r\n./configure\r\nMake   &&　　make  install\r\nCd  /usr/local/\r\nLl  -d  nagios\r\nChown   -R   nagios.nagios   nagios/\r\nChown   -R   nagios.nagios   /usr/local/nagios/libexec\r\nYum  install   xinetd  -y\r\nCd   nrpe-2.14\r\n./configure\r\nMake   all  \r\nMake  install-plugin\r\nMake  install-daemon\r\nMake  install-daemon-config\r\nMake  install-xinetd\r\nVi   /etc/xinetd.d/nrpe  更改如下：\r\n吧only-from    =  192.168.0.196 改成这样\r\nVi  /etc/services  更改如下:\r\nnrpe	5666/tcp  添加这一行让xinetd接听nrpe的端口\r\n/etc/init.d/xinetd   start\r\nNetstat  -natple   |  grep  5666\r\nCd  /usr/local/nagios/etc/\r\nVim   nrpe.cfg  更改如下：\r\n更改这行如command[check_disk]=/usr/local/nagios/libexec/check_disk  -w  20%  -c  10%  -p  /\r\n/etc/init.d/xinetd   restart\r\n在server96上也安装nrpe \r\nTar  zxf  nrpe-2.14.tar.gz\r\nCd   nrpe-2.14\r\n./configure\r\nMake   all \r\nMake  install-plugin\r\nCd  /usr/local/nagios/libexec/\r\n./check_nrpe   -H  192.168.0.127  \r\n如果出现NRPE  V2.14则配置成功\r\n./check_nrpe  -H  192.168.0.127   -c   check_disk\r\n./check_nrpe   -H  192.168.0.127  -c  check_users\r\nCd   /usr/local/nagios/etc/objects/\r\nVi   commands.cfg添加\r\nDefine  command{\r\n	Command_name    	check_nrpe\r\n	Command_line		$USER1$/check_nrpe  -H  $HOSTADDRESS$  -c  $ARG1$\r\n}\r\nVi  services.cfg添加\r\nDefine   servicegroup{\r\n	Servicegroup_name		系统负荷检查\r\n	Alias					系统负荷\r\n	Members server96.example.com,进程总数,server96.example.com,登录用户数,server96.example.com,交换空间利用率,server27.example.com,根分区,server27.example.com,登录用户数,server27.example.com,系统负荷\r\n}\r\nDefine  service{\r\n	Use  		local-service\r\n	Host_name	server27.example.com\r\n	Service_description	更分区\r\n	Check_command		check_nrpe!check_disk\r\n}\r\nDefine service{\r\n	Use 			local-service\r\n	Host_name	server27.example.com\r\n	Service_description		登录用户数\r\n	Check_command		check_nrpe!check_users\r\n}\r\nDefine  service{\r\n	Use 		local-service\r\n	Host_name	server27.example.com\r\n	Service_description		系统负荷\r\n	Check_command		check_nrpe!check_load\r\n}\r\n/usr/local/nagios/bin/nagios  -v  /usr/locals/nagios/etc/nagios.cfg   \r\n/etc/init.d/nagios   reload  这样就可以在图形中监控另外一台主机的根分区，登录用户等信息了。\r\n当系统出现问题时用飞信给管理员发短信\r\nGet  fetion  linuxso_2010113.tar.gz\r\nMv  fetion   /usr/local/nagios/libexec/\r\nCd  /usr/lib/\r\nTar  zxf   linuxso_20101113.tar.gz   -C  /usr/lib\r\nCd  /usr/lib \r\nLl\r\nChmod  +x  libACE-5.7.2.so  libACE_ssl-5.7.2.so  libcrypto.so.4  libssl.so.4\r\nLdconfig  /usr/lib   不关机的情况下更新系统的库\r\nCd /usr/local/nagios/libexec/\r\nChmod  +x   fetion\r\nChown  nagios.nagios  fetion \r\n./fetion   运行飞信提示错误\r\n-bash:./fetion :/lib/ld-linux.so.2:bad ELF  interpreter No such file or directory\r\nYum  install –y  /lib/ld-linux.so.2\r\nSu  nagios  \r\n/usr/local/nagios/libexec/fetion 提示错误  error  while  loading  share  libraries :libstdc++.so.6\r\nSu  -  root\r\n Yum install   libstdc++.so.6  -y \r\nSu  -  nagios  \r\n/usr/local/nagios/libexec/fetion提示错误error while  loading  shared  libraries: libgssapi_krb5.so.2\r\nSu  -  root \r\nYum   install  -y  libgssapi_krb5.so.2\r\nSu  -  nagios\r\n/usr/local/nagios/libexec/fetion提示错误error  while  loading shared  librarles:libz.so.1\r\nSu  -  root\r\nYum install –y libz.so.1  \r\nSu  -  nagios  \r\n/usr/local/nagios/libexec/fetion  好了\r\n/usr/local/nagios/libexec/fetion   --mobile=18091883113(发送飞信的号)\r\n  --pwd=（发送飞信的手机号的密码）  --to=18091883113(收飞信的手机号) –msg-utf8=”good luck（飞信的内容）”\r\n如果提示要输入验证码则在一台装了图形的主机上用ssh连接次主机然后cd  /usr/local/nagios/libexec  scp  13679270227.jpg  192.168.0.251:/home/wxh/Desktop(装了图形的主机) 然后再装了图形的主机上打开此图片得到验证码\r\nSu  -   nagios\r\nCd  /usr/local/nagios/libexec/\r\nVi   fetion.sh\r\n/usr/local/nagios/libexec/fetion   --mobile=13679270227   --pwd=yakxi007  --to=”$1” –msg-utf8=”$2”\r\nCd  /usr/local/nagios/etc/objects\r\nVi  commands.cfg 更改如下：\r\nDefine  command{\r\n	Command_name		notify-host-by-fetion\r\n	Command_line		$USER1$/fetion.sh		$CONTACTPAGER$”NOTIFICATIONTYPE$ Host  Alert: $HOSTNAME$ is $HOSTSTATE$”\r\n}\r\nDefine  command{\r\n	Command_name		notify-service-by-fetion\r\n	Command_line		$USER1$/fetion.sh $CONTACTPAGER$ “$NOTIFICATIONTYPE  service Alert:  $HOSTALIAS$/$SERVICEDESC$  is  $SERVICETATE$”\r\n}\r\nVi  templates.cfg 更改如下：\r\nDefine  contact{\r\n在这一样添加如下：\r\nHost_notification_commands			notify-host-by-email,notify-host-by-fetion\r\n}\r\nVi  contacts.cfg更改如下：\r\nDefine  contact{\r\n	加一行 pager			18209184795\r\n}\r\n/urs/local/nagios/bin/nagios   -v  /usr/local/nagios/etc/nagios.cfg  \r\n/etc/init.d/nagios    reload\r\n \r\n','2014-12-16 05:27:00','','',0,0,0);

UNLOCK TABLES;

/*Table structure for table `blog_blog_authors` */

DROP TABLE IF EXISTS `blog_blog_authors`;

CREATE TABLE `blog_blog_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_id` (`blog_id`,`author_id`),
  KEY `blog_blog_authors_7894a4cc` (`blog_id`),
  KEY `blog_blog_authors_e969df21` (`author_id`),
  CONSTRAINT `author_id_refs_id_f8fbf0b5` FOREIGN KEY (`author_id`) REFERENCES `blog_author` (`id`),
  CONSTRAINT `blog_id_refs_id_eadf1e79` FOREIGN KEY (`blog_id`) REFERENCES `blog_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `blog_blog_authors` */

LOCK TABLES `blog_blog_authors` WRITE;

insert  into `blog_blog_authors`(`id`,`blog_id`,`author_id`) values (1,1,2),(2,2,2),(3,2,4),(4,3,2);

UNLOCK TABLES;

/*Table structure for table `blog_user` */

DROP TABLE IF EXISTS `blog_user`;

CREATE TABLE `blog_user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `sex` varchar(10) NOT NULL,
  `email` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blog_user` */

LOCK TABLES `blog_user` WRITE;

insert  into `blog_user`(`id`,`username`,`password`,`realname`,`sex`,`email`) values (1,'冯宝宝','123456','baby','男','122727569@qq.com'),(2,'张三','2911357','张三','男','122727569@qq.com');

UNLOCK TABLES;

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

LOCK TABLES `django_admin_log` WRITE;

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values (1,'2014-12-16 02:32:31','2','冯宝宝',1,'',8,1),(2,'2014-12-16 02:32:43','2','冯宝宝',2,'没有字段被修改。',8,1),(3,'2014-12-16 02:33:52','1','lnmp搭建',1,'',9,1),(4,'2014-12-16 02:34:28','1','冯宝宝 ',1,'',7,1),(5,'2014-12-16 03:48:57','2','bao',1,'',4,1),(6,'2014-12-16 03:50:36','2','bao',2,'已修改 first_name，last_name，email 和 user_permissions 。',4,1),(7,'2014-12-16 05:22:45','4','张三',1,'',8,1),(8,'2014-12-16 05:24:44','2',' lvs搭建',1,'',9,1),(9,'2014-12-16 05:25:21','2','张三 ',1,'',7,1),(10,'2014-12-16 05:27:32','3',' nagios安装，部署',1,'',9,1);

UNLOCK TABLES;

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

LOCK TABLES `django_content_type` WRITE;

insert  into `django_content_type`(`id`,`name`,`app_label`,`model`) values (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'user','blog','user'),(8,'author','blog','author'),(9,'blog','blog','blog');

UNLOCK TABLES;

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

LOCK TABLES `django_migrations` WRITE;

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2014-12-16 02:27:29'),(2,'auth','0001_initial','2014-12-16 02:27:34'),(3,'admin','0001_initial','2014-12-16 02:27:37'),(4,'sessions','0001_initial','2014-12-16 02:27:37');

UNLOCK TABLES;

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

LOCK TABLES `django_session` WRITE;

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('5gmpwncexr3ejfm5cel48m9951cdzmff','MzNkNTA0YjY4MjA4NDEzYWUxMDkzODFkNTA0OTZkNWMzYWI0ZWVjMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxYmM2OGQwN2RiNTE1ZDQ4MmRlYmI1NWUwZWQ0ODM3NTQ4NzY1NjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-12-30 05:25:44'),('6qi1vkkmw2gmhr5s9vyl7jk7h5cnu0x3','MzNkNTA0YjY4MjA4NDEzYWUxMDkzODFkNTA0OTZkNWMzYWI0ZWVjMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImUxYmM2OGQwN2RiNTE1ZDQ4MmRlYmI1NWUwZWQ0ODM3NTQ4NzY1NjciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9','2014-12-30 03:10:20');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
