# Vue.js项目无法启动：sh: 1: vue-cli-service: not found

## 问题描述

使用 `npm run serve` 命令启动 Vue.js 项目时无法启动。具体报错如下：

```
$ npm run serve 

> front-end@0.1.0 serve
> vue-cli-service serve

sh: 1: vue-cli-service: not found
npm ERR! code 127
npm ERR! path /home/codists/projects/flask-vue-blog/front-end
npm ERR! command failed
npm ERR! command sh -c vue-cli-service serve

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/codists/.npm/_logs/2021-06-09T13_29_30_797Z-debug.log
```

## 问题定位

1、已经使用 `npm install -g @vue/cli` 安装了 Vue CLI。且 package.json 文件里面也包含了 `"@vue/cli-service": "~4.5.0"`。

但是有可能装的有问题，所以重新安装。

## 解决方法

1、重新安装

```
$ rm -rf node_modules/
$ npm install
```





