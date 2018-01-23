# fangPHP
fangPHP is a docker based development env with php7 mysql redis and livereload

## 如何使用

### Native Docker 的使用

如果你的系统可以安装 Native Docker，请继续阅读，如果不能（ Win10 只有专业版和服务器版才能安装 Native Docker ）,请直接跳到

1. 安装 Native Docker 社区版。https://www.docker.com/community-edition#/download
1. git clone https://github.com/easychen/fangPHP
1. cd https://github.com/easychen/fangPHP
1. docker-compose up
1. 在 ./web 目录下新建一个 index.php
1. 访问 o.ftqq.com ， 也就是 127.0.0.1 ，应该就能看到页面内容了

#### 管理数据库

1. 访问 o.ftqq.com/mysql.php 即可
1. 可以在左上角切换语言

#### 在 PHP 中访问 MySQL 和 Redis 

1. 使用 mysql.ftqq.com 作为 mysql 的 host
1. 使用 redis.ftqq.com 作为 redis 的 host

注意以上域名只在 PHP 环境内有效。

#### 使用 live-reload

1. 安装 Chrome 插件 https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei （无法访问商店的同学，可以打开 https://chrome-extension-downloader.com/ ， 输入上边的地址下载 ）
1. 打开 o.ftqq.com , 点击浏览器右上方的插件图标 ，会提示连接成功
1. 当你修改 ./web/ 下的 PHP、HTML、CSS 和 JS 文件时 ，页面会自动更新


### Docker ToolBox 的使用

对于 Win10 非专业版用户，可以通过安装 虚拟机实现的 Docker ToolBox 来使用本环境

1. https://docs.docker.com/toolbox/toolbox_install_windows/
1. 安装（安装时如果没有安装 git windows 版，记得同时选上 ）完成后，启动「 Docker Quickstart Terminal 」，进入命令行
1. 等待一段时间，按提示给予权限。最后会显示一个内网地址，一般是 192.168.99.100 这个要记录下，稍后有用。
1. git clone https://github.com/easychen/fangPHP
1. cd https://github.com/easychen/fangPHP
1. docker-compose.exe -f docker-compose.win.yaml up ( 注意这里使用的是专门的配置文件 )
1. 等待一段时间，服务应该都起来了，但是要注意，它的服务不是启动到 127.0.0.1，而是之前的那个地址，比如 192.168.99.100，这回导致 live-reload 失败，为了解决这个问题，我们需要做端口映射。
1. 在目录下的 port-remapping-for-toolkit-win.bat 上点右键，以管理员权限运行。看到「按任意键继续」后，不要点…… 点了映射就结束了，等你开发完了再点。
1. 在 ./web 目录下新建一个 index.php
1. 访问 o.ftqq.com ， 也就是 127.0.0.1 ，应该就能看到页面内容了

#### 管理数据库

1. 访问 o.ftqq.com/mysql.php 即可
1. 可以在左上角切换语言

#### 在 PHP 中访问 MySQL 和 Redis 

1. 使用 mysql.ftqq.com 作为 mysql 的 host
1. 使用 redis.ftqq.com 作为 redis 的 host

注意以上域名只在 PHP 环境内有效。

#### 使用 live-reload

1. 安装 Chrome 插件 https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei （无法访问商店的同学，可以打开 https://chrome-extension-downloader.com/ ， 输入上边的地址下载 ）
1. 打开 o.ftqq.com , 点击浏览器右上方的插件图标 ，会提示连接成功
1. 当你修改 ./web/ 下的 PHP、HTML、CSS 和 JS 文件时 ，页面会自动更新



## How to use

1. install docker on your computor
1. git clone https://github.com/easychen/fangPHP
1. cd https://github.com/easychen/fangPHP
1. docker-compose up
1. write a index.php file under ./web
1. visit o.ftqq.com , you should see the html

## Visit MySQL & Redis in PHP

1. use mysql.ftqq.com as mysql server host
1. use redis.ftqq.com as redis server host

## Using live-reload

1. install chrome extension here https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei
1. open o.ftqq.com , click the icon of chrome extension , it should be connected
1. change ./web/index.php , you will see the change

## Manage database

1. you can visit mysql via 3306 port on your computor directly

