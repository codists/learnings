# docker pull错误：read: connection reset by peer

## 错误描述

```bash
$ sudo docker pull redis
Using default tag: latest
Error response from daemon: Head https://registry-1.docker.io/v2/library/redis/manifests/latest: Get https://auth.docker.io/token?scope=repository%3Alibrary%2Fredis%3Apull&service=registry.docker.io: read tcp 192.168.0.109:45028->34.231.251.252:443: read: connection reset by peer
```

## 错误分析

### 原因1

根据提示内容，猜测是网络问题。因为是使用了科学上网的工具，所以断开科学上网的工具，然后使用 `sudo service docker restart` 命令重启 Docker，然后重新下载。至于开启了科学上网工具为什么会导致这个问题，暂时不得而知。

### 说明

对于网络问题，也有可能是其它原因。

## 解决方法

### 解决方法1（对应原因1）

（1）断开科学上网的工具。

（2）重启 Docker

```
$ sudo service docker restart
```

（3）重新 pull 

```
$ sudo docker pull redis
Using default tag: latest
latest: Pulling from library/redis
b4d181a07f80: Already exists 
86e428f79bcb: Pull complete 
ba0d0a025810: Pull complete 
ba9292c6f77e: Pull complete 
b96c0d1da602: Pull complete 
5e4b46455da3: Pull complete 
Digest: sha256:b6a9fc3535388a6fc04f3bdb83fb4d9d0b4ffd85e7609a6ff2f0f731427823e3
Status: Downloaded newer image for redis:latest
docker.io/library/redis:latest
```





