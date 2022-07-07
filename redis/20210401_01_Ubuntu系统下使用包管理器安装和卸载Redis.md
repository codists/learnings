Ubuntu系统下使用包管理器安装和卸载Redis
---

# 环境说明

1、Ubuntu: Ubuntu 20.04.2 LTS

# 安装步骤 

下面根据 Redis 官网的安装说明 [From the official Ubuntu PPA](https://redis.io/download#from-the-official-ubuntu-ppa) 进行操作。

```
$ sudo add-apt-repository ppa:redislabs/redis
$ sudo apt-get update
$ sudo apt-get install redis
```

说明：

（1）` add-apt-repository`:

 命令将 Redis 仓库添加到 Ubuntu 系统的 apt 索引。第一句执行后，会将 `redislabs-ubuntu-redis-focal.list` 文件添加到 Ubuntu 的 `/etc/apt/sources.list.d` 中。add-apt-repository 详细用法见：[add-apt-repository](https://manpages.ubuntu.com/manpages/focal/man1/add-apt-repository.1.html)。

```
$ cd /etc/apt/sources.list.d/
$ ls -a
redislabs-ubuntu-redis-focal.list
```

注：如果系统提示 `sudo: add-apt-repository: command not found`，按顺序执行下列命令：

```
$ sudo apt-get install software-properties-common
$ sudo apt-get update
```

（2）`apt-get update` 

`update` 命令更新 `/var/lib/apt/lists/` 目录里的软件源。即将 Redis 相关文件添加到 `/var/lib/apt/lists/` 目录。

```
ls  | grep "redis"
ppa.launchpad.net_redislabs_redis_ubuntu_dists_focal_InRelease
ppa.launchpad.net_redislabs_redis_ubuntu_dists_focal_main_binary-amd64_Packages
ppa.launchpad.net_redislabs_redis_ubuntu_dists_focal_main_binary-i386_Packages
ppa.launchpad.net_redislabs_redis_ubuntu_dists_focal_main_i18n_Translation-en
```

（3）`apt-get install`

安装 Redis。执行此命令后:

a、Redis 的配置文件（如 redis.conf）会被安装到 `/etc/redis` 目录。

b、可执行文件安装到 `/usr/bin` 目录（如：redis-server）。

c、文档会被安装到 `/usr/share/man/man1` 目录下（我们使用 `man redis-server` 查看帮助文档的时候会用到这些文档）。

# Redis 的启动与停止

## 查看 Redis 是否已经启动

```
$ ps -aux | grep "redis"
redis      30858  0.4  0.4  60828  9176 ?        Ssl  07:35   0:19 /usr/bin/redis-server 127.0.0.1:6379
root       31411  0.0  0.0   9032   736 pts/0    S+   08:41   0:00 grep --color=auto redis
```

注：这里 Redis 进程的用户是 Redis，如果使用

## 停止 Redis

方式一：上面的 Redis 是用户 Redis 启动的，我们可以使用下述方式停止：

```
$ sudo /etc/init.d/redis-server stop
```

方式二：如果 Redis 的用户是 root 启动的，我们可以使用下述方式停止：

```
$ redis-cli SHUTDOWN
```

## 启动 Redis

```
$ redis-server
```

## 设置开机启动

# 卸载 Redis

因为这里使用的是包管理器安装的，所以，如果需要卸载 Redis，也可以使用包管理器进行卸载。

```
$ sudo apt-get purge redis
```

说明：

（1）`purge`：不仅删除安装包同时也删除配置文件。

# 参考资料

[1] add-apt-repository: https://manpages.ubuntu.com/manpages/focal/man1/add-apt-repository.1.html

[2]apt: https://manpages.ubuntu.com/manpages/focal/en/man8/apt.8.html



