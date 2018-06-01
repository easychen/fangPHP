# fangPHP
fangPHP is a docker based development env with php7 mysql redis and livereload

fangPHP 的目标是一个跨平台（ Mac / Linux / Win ）的 PHP 开发环境，主要用于教学。它解决的是：老师讲了，学生回去做的时候，不能复现例子，最后查出来是环境差异的问题。


## 安装和启动

分为三步

1. 安装 Docker（ 这是我们的容器平台 ）以及 Docker-compose（ 这是我们编排容器的工具，Linux上需要单独安装 ）
1. 启动 fangPHP 环境
1. 安装 Live-reload 插件
1. 使用说明

### 安装 Docker

不同的操作系统安装 Docker 的方式不同，以下做分别的讲解。

#### Windows用户

> Windows 因为版本差异、环境不同会遇到各种奇形怪状的问题，推荐大家直接安装 Ubuntu / Windows 双系统，然后在 Ubuntu 下进行开发，能节约很多时间。

首先，请[按此提示查看Windows的版本](https://jingyan.baidu.com/article/642c9d34032de3644a46f7bd.html)。

#### Win10 专业版和服务器版（ Win10 的其他版本看后边 ）

微软在 Win10 专业版、教育版和服务器版中，提供了 Hyper V 虚拟化技术，所以这部分用户可以安装最新的原生 Docker 客户端。
Docker 提供面向企业的付费版本（EE）和面向社区的免费版本（CE），我们使用CE。

[下载地址](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe) [官方网站](https://www.docker.com/community-edition#/download)

安装时记得选中 git for windows ，这是我们检出代码时要用到的工具。

#### 其他 Windows 版本，包括 Win10 的家庭版等等

由于没有容器化技术的支持，其他的 Windows 版本只能通过虚拟机的方案来实现。这时候我们需要用到 Docker ToolBox。

1. 下载页面 https://docs.docker.com/toolbox/toolbox_install_windows/
1. 安装（安装时如果没有安装 git windows 版，记得同时选上 ）
1. 完成后，启动「 Docker Quickstart Terminal 」，进入命令行
1. 等待一段时间，按提示给予权限。最后会显示一个内网地址，一般是 192.168.99.100 。

原生 Docker 客户端的服务是启动在 127.0.0.1 上边的 ， 为了保证环境的统一，我们将 192.168.99.100 的端口 映射到 127.0.0.1 上：

1. git clone https://github.com/easychen/fangPHP ( clone fangPHP 代码到本地 )
1. 以管理员身份运行 fangPHP 目录下的 port-remapping-for-toolkit-win.bat 启动以后挂着就行，不用的时候再点任意键关掉
1. 如果你的IP不是 192.168.99.100 ， 请用编辑器打开 port-remapping-for-toolkit-win.bat ， 将 192.168.99.100 替换为对应的 IP。
1. 因为 Windows 的一个 Bug（ https://support.microsoft.com/en-us/help/555744 ），如果这个脚本不生效，请检查是否电脑是否安装了 IPV6MON.DLL 

### Linux 

按官方的安装提示进行安装，以下链接以 Ubuntu 为例，左侧菜单处可切换其他发行版。( 18.04 请参考[这篇文章](https://medium.com/devgorilla/how-to-install-docker-on-ubuntu-18-04-495216a16092) 需科学访问 )
https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce

注意 apt-get 里边的 docker-compose 版本过低，不要通过 apt-get install docker-compose 安装，可按以下命令安装

```
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose
```

### Mac 

Mac 系统可以使用原生的 Docker 客户端，[下载地址](https://download.docker.com/mac/stable/Docker.dmg) [官方网站](https://www.docker.com/community-edition#/download)


## 启动 fangPHP

进入命令行，选择一个用来存放代码的目录（ 路径中不要包含中文，不然某些版本的 Docker 会出错 ）

检出代码：

1. 运行 git 命令检出代码 `git clone https://github.com/easychen/fangPHP`
1. 进入代码目录 `cd fangPHP`   

启动：

使用 Mac 和 Linux 的同学运行 `docker-compose up`
使用 Windows 的同学运行 `docker-compose.exe -f docker-compose.win.yaml up`

注意这里 Windows 使用了独立的配置，否则 MySQL 服务会无法启动。

```
报错备用方案：

Mac & Linux : 将 docker-composer.yaml 第4行  build: ./buildLNP 换成     image: hub.c.163.com/easychen/apncore:latest 

Win：将 docker-composer.win.yaml 第4行  build: ./buildLNP 换成     image: hub.c.163.com/easychen/apncore:latest 
```

添加测试 PHP 文件：

在 fangPHP 目录下，进入 `data/web` ， 新建 `index.php` 文件，内容为:

`<?php
echo "Hello world";
`

打开浏览器，访问 o.ftqq.com ，应该就能看到输出的结果了。

如果在 Windows 上创建了 index.php ，访问还是403，那么请打开 kitematic ( 桌面快捷方式的另一个 )，然后启动（可跳过登录），进入容器的可视化管理界面。

![](https://ws1.sinaimg.cn/large/40dfde6fly1frea4rta0tj21900scn47.jpg)


在左侧菜单中选择名称中包含 php7.ftqq.com 的镜像，然后，在右边的共享目录设置处点击齿轮图标。

把 local folder 改到 `你安装fangPHP的目录`+ `data/web`（如果选中后提示权限不够，将安装目录放到你的用户目录下边） ，应该就能找到 index.php 啦。
![](https://ws1.sinaimg.cn/large/40dfde6fly1frea9ulglwj21900scwge.jpg)


## 安装 Live-reload 插件

1. 打开 Chrome 浏览器，进入插件页面，将 fangPHP 目录下的 LiveReload_v2.1.0.crx 拖拽到浏览器中的插件 Tab，放开即可安装
1. 打开 o.ftqq.com , 点击浏览器右上方的插件图标 ，会提示连接成功
1. 当你修改 data/web 下的 PHP、HTML、CSS 和 JS 文件时 ，页面会自动更新


#### 管理数据库

1. 访问 o.ftqq.com/mysql.php 即可
1. 可以在左上角切换语言
1. 默认账号信息如下，可在 docker-compose.yaml 中修改：
```
    MYSQL_HOST: mysql.ftqq.com
    MYSQL_ROOT_PASSWORD: itworks1343
    MYSQL_DATABASE: fangtangdb
    MYSQL_USER: php
    MYSQL_PASSWORD: fangtang
```

#### 在 PHP 中访问 MySQL 和 Redis 

1. 使用 mysql.ftqq.com 作为 mysql 的 host
1. 使用 redis.ftqq.com 作为 redis 的 host

注意以上域名只在 PHP 环境内有效。

